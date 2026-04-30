(use-package treemacs
  :vc (:url "https://github.com/Alexander-Miller/treemacs")
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t t"   . treemacs)
        ("C-x t C-t" . treemacs-find-file))
  :config
  (setq treemacs-header-scroll-mode nil
        treemacs-no-png-images t ;; Optional: better performance
        treemacs-project-follow-mode t)
  
  ;; This connects Treemacs to the built-in project.el system
  (with-eval-after-load 'project
    (define-key project-prefix-map (kbd "t") #'treemacs-add-and-display-current-project)))

(provide 'treemacs-config)
