;;; core.el --- package system & basics

(require 'package)

(setq package-archive-priorities
      '(("melpa-stable" . 20)
        ("melpa" . 10)
        ("gnu" . 5)
        ("nongnu" . 1)))


(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org"   . "https://orgmode.org/elpa/")
        ("gnu"   . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;; Auto-reload files changed outside Emacs (git updates, external edits, etc).
(setq auto-revert-verbose nil
      global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)


;; Put ALL auto-save files in /tmp/, regardless of buffer default-directory
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "/tmp/") t)))

;; Optional: also put backup~ files in one place
(setq backup-directory-alist
      `(("." . ,(expand-file-name "~/.emacs.d/backups/"))))
