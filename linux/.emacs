(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-search-module 'evil-search)
  :config
  (setq evil-ex-search-case 'sensitive)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (evil-mode 1))
(use-package rc-mode
  :ensure t)
;; (use-package ox-hugo
;;   :config
;;   (setq org-hugo-base-dir "~/etc/blog")
;;   (setq org-hugo-goldmark 1)
;;   (setq org-hugo-export-with-toc -1)
;;   (setq org-hugo-front-matter-format "yaml")
;;   (setq org-hugo-date-format "%Y-%m-%d")
;;   (setq org-hugo-default-section-directory " ")
;;   :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
(use-package ledger-mode
  :hook
  (ledger-mode . (lambda ()
    (setq-local tab-always-indent 'complete)
    (setq-local completion-cycle-threshold t)
    (setq-local ledger-complete-in-steps t)))
  :init
  (add-to-list 'auto-mode-alist
      '("\\.dat\\'" . ledger-mode))
  :ensure t)
(use-package olivetti
  :hook
  (olivetti-mode-on .
    (lambda ()
      (setq header-line-format " ")
      (org-overview)
      (org-show-entry)
      (org-show-children)
      (visual-line-mode 1)
      (display-line-numbers-mode -1)))
  (olivetti-mode-off .
    (lambda ()
      (visual-line-mode -1)
      (setq header-line-format nil)
      (display-line-numbers-mode 1)))
  :custom
  (olivetti-body-width 70)
  :ensure t)
(use-package go-mode
  :ensure t)
(use-package ox-reveal
  :ensure t
  :config
  (setq org-html-coding-system 'utf-8-unix)
  ;; https://cdn.jsdelivr.net/npm/reveal.js
  (setq org-reveal-root "/usr/lib64/node_modules/reveal.js"))
(use-package deft
  :ensure t
  :hook
  (deft-mode . olivetti-mode)
  :config
  (setq deft-recursive t)
  (setq deft-extensions '("org"))
  (setq deft-directory "~/opt/deft"))
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "librewolf")
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
	"xelatex -interaction nonstopmode -output-directory %o %f"
	"xelatex -interaction nonstopmode -output-directory %o %f"))
(setq org-latex-minted-options '(("breaklines" "true")
                                 ("breakanywhere" "true")))
(setq shell-file-name "/bin/bash")
;; (setq explicit-shell-file-name "/bin/bash")
;; (setq org-latex-listings 'minted
;;       org-latex-packages-alist '("" "minted"))
;; (setq org-latex-listings 'minted
;;       org-latex-packages-alist '("" "minted"))
;; (setq TeX-command-extra-options "-shell-escape")

; (add-to-list 'org-latex-classes
;              '("beamer" "\\documentclass{beamer}"))
; (use-package plantuml-mode
;   :ensure t
;   :config
;   (setq plantuml-output-type "png")
;   (setq plantuml-executable-path "/usr/bin/plantuml")
;   (setq plantuml-default-exec-mode 'executable))
(use-package yaml-mode
  :ensure t)
; (use-package org-present
;   :ensure t
;   :hook
;   (org-present-mode .
;     (lambda ()
;       (olivetti-mode)
;       (org-present-hide-cursor)
;       (org-present-read-only)))
;   (org-present-mode-quit .
;     (lambda ()
;       (olivetti-mode -1)
;       (org-present-show-cursor)
;       (org-present-read-write)))
;   :bind
;   (:map org-present-mode-keymap
;         ("C-c C-j" . org-present-next)
;         ("C-c C-k" . org-present-prev))
;   :ensure t)
; (org-babel-do-load-languages
;  'org-babel-load-languages
;  '((plantuml . t)))
; (setq org-plantuml-jar-path (expand-file-name "/usr/share/plantuml/lib/plantuml.jar"))
(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.jpg\\'" . "sxiv %s")
        ("\\.jpeg\\'" . "sxiv %s")
        ("\\.png\\'" . "sxiv %s")
        ("\\.pdf\\'" . "zathura %s")
        ("\\.odt\\'" . "libreoffice %s")))
(setq vc-follow-symlinks t)
(setq visible-bell t)
(setq ring-bell-function #'ignore)
(menu-bar-mode -1)
(tab-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 0)
(setq org-hide-emphasis-markers t)
(setq inhibit-startup-screen t)
(setq backup-inhibited t)
(setq auto-save-default nil)
(global-display-line-numbers-mode 1)
(setq-default display-line-numbers-widen t)
(setq column-number-mode t)
(show-paren-mode 1)
(setq-default mode-line-format nil)
(setq line-number-mode t)
(setq-default indicate-empty-lines t)
(setq make-pointer-invisible t)
(setq org-src-fontify-natively t)
(setq-default truncate-lines t)
(setq org-directory "~/usr/org")
(setq org-agenda-files '("agenda/work.org" "agenda/self.org"))
(setq initial-scratch-message "")
(global-eldoc-mode -1)
(fset 'display-startup-echo-area-message 'ignore)
(set-face-background 'header-line "black")
(set-face-background 'org-block "gray10")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(edit-indirect markdown-mode yaml-mode use-package ox-reveal ox-hugo olivetti ledger-mode go-mode evil-collection deft)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
