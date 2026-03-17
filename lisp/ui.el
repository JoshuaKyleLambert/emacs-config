;;; ui.el --- theme, modeline, general look

(setq inhibit-startup-message t)
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(global-subword-mode 1)

(use-package doom-themes
  :config (load-theme 'doom-one t))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package recentf
  :init
  (setq recentf-max-menu-items 25
        recentf-max-saved-items 200)
  :config
  (recentf-mode 1))

(setq desktop-restore-frames nil)
(desktop-save-mode 1)

(defvar my/frame-geometry-file
  (expand-file-name "frame-geometry.el" user-emacs-directory)
  "File used to persist the last GUI frame geometry.")

(defun my/frame-geometry-parameters (&optional frame)
  "Return persisted geometry parameters for FRAME."
  (let ((frame (or frame (selected-frame))))
    (when (display-graphic-p frame)
      `((top . ,(frame-parameter frame 'top))
        (left . ,(frame-parameter frame 'left))
        (width . ,(frame-width frame))
        (height . ,(frame-height frame))
        (fullscreen . ,(frame-parameter frame 'fullscreen))
        (maximized . ,(frame-parameter frame 'maximized))))))

(defun my/save-frame-geometry (&optional frame)
  "Persist GUI frame geometry for FRAME."
  (let ((params (my/frame-geometry-parameters frame)))
    (when params
      (with-temp-file my/frame-geometry-file
        (prin1 params (current-buffer))))))

(defun my/load-frame-geometry ()
  "Load persisted GUI frame geometry from disk."
  (when (file-readable-p my/frame-geometry-file)
    (with-temp-buffer
      (insert-file-contents my/frame-geometry-file)
      (read (current-buffer)))))

(defun my/apply-frame-geometry (&optional frame)
  "Apply persisted GUI frame geometry to FRAME."
  (let ((frame (or frame (selected-frame)))
        (params (my/load-frame-geometry)))
    (when (and params (display-graphic-p frame))
      (let ((width (alist-get 'width params))
            (height (alist-get 'height params))
            (left (alist-get 'left params))
            (top (alist-get 'top params))
            (fullscreen (alist-get 'fullscreen params)))
        (when (and width height)
        (set-frame-size frame width height))
        (when (and left top)
          (set-frame-position frame left top))
        (when fullscreen
          (set-frame-parameter frame 'fullscreen fullscreen))))))

(defun my/save-selected-frame-geometry ()
  "Persist the currently selected GUI frame geometry."
  (my/save-frame-geometry (selected-frame)))

(add-hook 'kill-emacs-hook #'my/save-selected-frame-geometry)
(add-hook 'delete-frame-functions #'my/save-frame-geometry)
(add-hook 'focus-out-hook #'my/save-selected-frame-geometry)
(add-hook 'emacs-startup-hook #'my/apply-frame-geometry)
(add-hook 'after-make-frame-functions #'my/apply-frame-geometry)

;; Line numbers everywhere programming happens
(setq display-line-numbers-type 't)
(setq display-line-numbers-width-start t)
(dolist (hook '(prog-mode-hook
                clojure-ts-mode-hook))
  (add-hook hook #'global-display-line-numbers-mode))

;;
(global-prettify-symbols-mode 1)

(when (display-graphic-p)
  (dolist (font '("JetBrainsMono Nerd Font Mono"
                  "JetBrainsMono Nerd Font"
                  "JetBrainsMono NF"))
    (when (member font (font-family-list))
      (set-face-attribute 'default nil :family font :height 120)
      (cl-return))))

(provide 'ui)
