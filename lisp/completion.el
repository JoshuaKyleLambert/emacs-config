;; completion.el
(use-package vertico :init (vertico-mode))
(use-package orderless :init (setq completion-styles '(orderless basic)))
(use-package marginalia :after vertico :init (marginalia-mode))
(use-package consult)

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.2
        company-backends '(company-capf company-dabbrev-code)
        cider-completion-use-context t))

(provide 'completion)
