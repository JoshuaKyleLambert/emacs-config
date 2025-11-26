;; lsp.el
(use-package lsp-mode
  :commands lsp
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-indentation t
        lsp-enable-on-type-formatting t
        lsp-idle-delay 0.3
        ;; ensure server binary name; remote host must have clojure-lsp in PATH
        lsp-clojure-server-command '("clojure-lsp")))

(use-package lsp-ui :after lsp-mode :commands lsp-ui-mode)
(use-package treemacs :defer t)
(use-package lsp-treemacs :after (lsp-mode treemacs))

(provide 'lsp)

