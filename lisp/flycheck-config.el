(use-package flycheck
  :ensure t
  :hook ((clojure-mode clojure-ts-mode) . flycheck-mode))

(use-package flycheck-clj-kondo
  :ensure t
  :after flycheck)

(provide 'flycheck-config)
