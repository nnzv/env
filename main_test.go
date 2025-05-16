package main

import (
	"context"
	"log/slog"
	"os"
	"path/filepath"
	"testing"
)

func TestSync_Do(t *testing.T) {
	tests := []struct {
		name     string
		goos     string
		testData string
		wantErr  bool
	}{
		{
			name:     "valid_linux_copy",
			goos:     "linux",
			testData: "testdata/linux/file1.txt",
			wantErr:  false,
		},
		{
			name:     "missing_os_dir",
			goos:     "windows",
			testData: "testdata/windows/nonexistent.txt",
			wantErr:  true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			target := t.TempDir()
			s := &Sync{
				Source: "testdata",
				Target: target,
				Logger: slog.New(
					slog.NewTextHandler(os.Stderr,
						&slog.HandlerOptions{
							Level: slog.LevelInfo,
						},
					),
				),
				OS: tt.goos,
			}
			err := s.Do(context.TODO())
			if (err != nil) != tt.wantErr {
				t.Errorf("Do() error = %v, wantErr %v", err, tt.wantErr)
			}
			if tt.wantErr {
				t.Logf("expected error; skipping validation")
				return
			}
			expectedPath := filepath.Join(target, filepath.Base(tt.testData))
			fi, err := os.Lstat(expectedPath)
			if err != nil {
				t.Fatalf("expected symlink not found: %v", err)
			}
			if fi.Mode()&os.ModeSymlink == 0 {
				t.Errorf("expected a symlink at %s, but found regular file", expectedPath)
			}
			linkDest, err := os.Readlink(expectedPath)
			if err != nil {
				t.Fatalf("failed to read symlink: %v", err)
			}

			expectedTarget := filepath.Join("testdata", tt.goos, filepath.Base(tt.testData))
			if linkDest != expectedTarget {
				t.Errorf("symlink target mismatch: got %s, want %s", linkDest, expectedTarget)
			}
		})
	}
}
