;;; ui.el --- theme, modeline, general look

(setq inhibit-startup-message t)
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(global-subword-mode 1)

(use-package doom-themes
  :config (load-theme 'doom-one t))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package recentf
  :init
  (setq recentf-max-menu-items 25
        recentf-max-saved-items 200)
  :config
  (recentf-mode 1))

;; Line numbers everywhere programming happens
(setq display-line-numbers-type 't)
(setq display-line-numbers-width-start t)
(dolist (hook '(prog-mode-hook
                clojure-ts-mode-hook))
  (add-hook hook #'global-display-line-numbers-mode))

(provide 'ui)

