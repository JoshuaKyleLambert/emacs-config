;;; ai.el --- AI helpers -*- lexical-binding: t; -*-

(use-package gptel
  :ensure t
  :commands (gptel gptel-send gptel-region)
  :config
  ;; Choose a neutral default model; easy to change later
  (setq gptel-model "gpt-4.1-mini")

  ;; Keep conversations in plain buffers
  (setq gptel-default-mode 'markdown-mode))
