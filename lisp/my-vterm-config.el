(use-package vterm
  :ensure t
  :bind (("C-c t" . vterm) ; Quick acceds with Ctrl-c t
         ("C-c T" . my/open-new-vterm))
  :config
  (setq vterm-max-scrollback 10000)
  (defun my/open-new-vterm ()
    "Force open a new vterm buffer."
    (interactive)
    (vterm t))) ;; Passing 't' tells vterm to create a new one

(provide 'setup-vterm)
