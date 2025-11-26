;; repl.el
(use-package cider
  :defer t
  :config
  (setq cider-repl-display-help-banner nil
        cider-repl-use-pretty-printing t
        nrepl-log-messages t))

(defun my/clojure-project-root ()
  "Return a sensible project root (project / projectile)."
  (or (when (fboundp 'project-root) (when (project-current) (project-root (project-current))))
      (when (fboundp 'projectile-project-root) (projectile-project-root))
      default-directory))

(defun my/cider-auto-start-on-open ()
  "Auto-start cider REPL when opening a clojure buffer in a project root.
Safe: only attempts jack-in when not already connected."
  (when (and (derived-mode-p 'clojure-ts-mode 'clojure-mode)
             (fboundp 'cider-jack-in)
             (my/clojure-project-root)
             (not (cider-connected-p)))
    (let ((default-directory (my/clojure-project-root)))
      (ignore-errors
        (cider-jack-in nil)))))

;; Attach auto-start to both ts-mode and legacy mode
(add-hook 'clojure-ts-mode-hook #'my/cider-auto-start-on-open)
(add-hook 'clojure-mode-hook #'my/cider-auto-start-on-open)

;; Useful keys
(global-set-key (kbd "C-c r") 'cider-refresh)
(global-set-key (kbd "C-c e") 'cider-eval-buffer)
(global-set-key (kbd "C-c s") 'sp-forward-slurp-sexp)
(global-set-key (kbd "C-c b") 'sp-forward-barf-sexp)

(provide 'repl)

