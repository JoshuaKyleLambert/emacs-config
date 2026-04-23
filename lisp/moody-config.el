;;; moody-config.el --- moody mode line -*- lexical-binding: t; -*-

(use-package moody
  :ensure t
  :init
  ;; `moody` builds on the standard mode line, so disable doom-modeline.
  (remove-hook 'after-init-hook #'doom-modeline-mode)
  (when (bound-and-true-p doom-modeline-mode)
    (doom-modeline-mode -1))
  :config
  (setq x-underline-at-descent-line t
        moody-mode-line-height 24)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(provide 'moody-config)
