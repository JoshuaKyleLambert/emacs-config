(use-package vterm
  :ensure t
  :bind ("C-c t" . vterm) ; Quick acceds with Ctrl-c t
  :config
  (setq vterm-max-scrollback 10000))
