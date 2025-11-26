;; clojure.el

;; Ensure clojure-ts-mode is used for .clj/.cljs/.cljc if treesit is available,
;; otherwise fall back to clojure-mode.
(when (and (fboundp 'treesit-available-p) (treesit-available-p))
  (add-to-list 'auto-mode-alist '("\\.clj\\'"  . clojure-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojurescript-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.cljc\\'" . clojurec-ts-mode))
  (add-hook 'clojure-ts-mode-hook
            (lambda ()
              (setq treesit-font-lock-level 4)
              (subword-mode 1))))

;; For installations that still have clojure-mode, keep it in the list too:
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode) t)

;; clj-refactor supports clojure-ts-mode via clojure-mode compatibility.
;;(use-package clj-refactor
;;  :ensure t
;;  :pin melpa-stable
;;  :hook ((clojure-mode clojure-ts-mode) . clj-refactor-mode)
;;  :config (cljr-add-keybindings-with-prefix "C-c C-m"))

;; Structural editing using smartparens on ts-mode and legacy mode
(use-package smartparens
  :hook ((clojure-ts-mode clojure-mode) . smartparens-strict-mode)
  :config
  (require 'smartparens-config)
  (sp-with-modes '(clojure-ts-mode clojure-mode clojurescript-mode clojurec-mode)
    (sp-local-pair "{" "}")
    (sp-local-pair "[" "]")
    (sp-local-pair "(" ")")))

(provide 'clojure)

