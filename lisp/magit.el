;;; magit.el --- Git integration -*- lexical-binding: t; -*-

(use-package magit
  :ensure t
  :commands (magit-status magit-blame)
  :bind (("C-x g" . magit-status)))

;; Optional but recommended
(use-package diff-hl
  :ensure t
  :hook ((prog-mode . diff-hl-mode)
         (text-mode . diff-hl-mode)
         (dired-mode . diff-hl-dired-mode))
  :config
  (diff-hl-flydiff-mode))
