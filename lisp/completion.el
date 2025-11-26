;; completion.el
(use-package vertico :init (vertico-mode))
(use-package orderless :init (setq completion-styles '(orderless basic)))
(use-package marginalia :after vertico :init (marginalia-mode))
(use-package consult)

(provide 'completion)

