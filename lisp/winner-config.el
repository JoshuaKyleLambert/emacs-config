(use-package winner
  :ensure nil
  :bind (:map winner-mode-map
              ("C-c <left>" . winner-undo)
              ("C-c <right>" . winner-redo))
  :config
  (winner-mode 1))

;; Note: By using :bind above, Emacs explicitly maps these keys
;; for you, but the default C-c <left> / <right> will work 
;; as soon as (winner-mode 1) is called.

(provide 'winner-config)
