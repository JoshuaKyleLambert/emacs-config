;;; rust.el --- Rust support

(setq lsp-rust-analyzer-cargo-watch-command "clippy"
      lsp-rust-analyzer-server-display-inlay-hints t
      lsp-rust-analyzer-display-chaining-hints t
      lsp-rust-analyzer-display-parameter-hints t)

(defun my/rust-treesit-ready-p ()
  "Return non-nil when the Rust tree-sitter grammar is available."
  (and (fboundp 'treesit-ready-p)
       (treesit-ready-p 'rust)))

(when (my/rust-treesit-ready-p)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode)))

(defun my/rust-cargo-check ()
  "Run `cargo check` for the current project."
  (interactive)
  (compile "cargo check"))

(defun my/rust-mode-setup ()
  "Shared setup for Rust editing."
  (setq-local indent-tabs-mode nil)
  (when (boundp 'treesit-font-lock-level)
    (setq-local treesit-font-lock-level 4))
  (when (fboundp 'rust-format-buffer)
    (add-hook 'before-save-hook #'rust-format-buffer nil t))
  (local-set-key (kbd "C-c C-c") #'rust-run)
  (local-set-key (kbd "C-c C-t") #'rust-test)
  (local-set-key (kbd "C-c C-f") #'rust-format-buffer)
  (local-set-key (kbd "C-c C-k") #'my/rust-cargo-check)
  (lsp-deferred))

(use-package rust-mode
  :mode "\\.rs\\'"
  :hook (rust-mode . my/rust-mode-setup))

(use-package cargo
  :hook ((rust-mode rust-ts-mode) . cargo-minor-mode))

(use-package toml-mode
  :mode "\\.toml\\'")

(when (fboundp 'rust-ts-mode)
  (add-hook 'rust-ts-mode-hook #'my/rust-mode-setup))

(provide 'rust)
