package main

import (
	"context"
	"fmt"
	"log/slog"
	"os"
	"path/filepath"
	"runtime"
)

type Sync struct {
	Source string
	Target string
	Logger *slog.Logger
	OS     string
}

type Syncer interface {
	Do(context.Context) error
}

func NewSync(source string) (*Sync, error) {
	home, err := os.UserHomeDir()
	if err != nil {
		return nil, err
	}
	return &Sync{
		Source: source,
		Target: home,
		Logger: slog.New(
			slog.NewTextHandler(os.Stderr,
				&slog.HandlerOptions{
					Level: slog.LevelInfo,
				},
			),
		),
		OS: runtime.GOOS,
	}, nil
}

func (s *Sync) Do(ctx context.Context) error {
	osDir := s.OS // e.g. "linux", "windows", etc.
	osSource := filepath.Join(s.Source, osDir)
	if _, err := os.Stat(osSource); os.IsNotExist(err) {
		return fmt.Errorf("os-specific directory %s does not exist", osSource)
	}
	err := filepath.Walk(osSource, func(srcPath string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if info.IsDir() {
			return nil
		}
		relPath, err := filepath.Rel(osSource, srcPath)
		if err != nil {
			return fmt.Errorf("relpath error: %w", err)
		}
		dstPath := filepath.Join(s.Target, relPath)
		if err := os.MkdirAll(filepath.Dir(dstPath), 0755); err != nil {
			return err
		}
		if _, err := os.Lstat(dstPath); err == nil {
			if err := os.Remove(dstPath); err != nil {
				return fmt.Errorf("remove existing file at %s: %w", dstPath, err)
			}
		}
		absSrcPath, err := filepath.Abs(srcPath)
		if err != nil {
			return fmt.Errorf("abs path for %s: %w", srcPath, err)
		}
		if err := os.Symlink(absSrcPath, dstPath); err != nil {
			return fmt.Errorf("symlink %s -> %s: %w", srcPath, dstPath, err)
		}
		s.Logger.Info("symlinked", slog.String("from", absSrcPath), slog.String("to", dstPath))
		return nil
	})
	if err != nil {
		return fmt.Errorf("file sync error: %w", err)
	}
	return nil
}

func main() {
	syc, err := NewSync(".")
	if err != nil {
		slog.Error("init failed", slog.String("err", err.Error()))
		os.Exit(1)
	}
	if err := syc.Do(context.Background()); err != nil {
		syc.Logger.Error("sync failed", slog.String("err", err.Error()))
		os.Exit(1)
	}
}
