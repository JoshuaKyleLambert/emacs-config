(use-package desktop
  :config
  (desktop-save-mode 1)
  ;; This prevents Emacs from asking "Do you want to save?" every time
  (setq desktop-save t)
  ;; This ensures it looks for the desktop file in your .emacs.d
  (setq desktop-path (list user-emacs-directory)))

(provide 'session-config)
