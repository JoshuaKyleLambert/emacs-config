(use-package which-key
  :ensure t
  :diminish
  :init
  (which-key-mode)
  :config
  (setq which-key-idle-delay 0.5   ;; delay before popup
        which-key-max-description-length 40))
