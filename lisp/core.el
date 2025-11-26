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
