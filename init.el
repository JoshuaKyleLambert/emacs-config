;; --- Load Path ---
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; --- Modules ---
(load "core.el")
(load "ui.el")
(load "completion.el")
(load "window.el")
(load "lsp.el")
(load "clojure.el")
(load "repl.el")
(load "tramp-config.el")
(load "which-key-config.el")

;; --- Custom file ---
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

