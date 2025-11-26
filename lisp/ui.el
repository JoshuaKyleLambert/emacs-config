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


(provide 'ui)

