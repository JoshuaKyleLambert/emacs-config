;; tramp-config.el - do NOT name this tramp.el
(with-eval-after-load 'tramp
  (setq tramp-default-method "ssh"
        tramp-verbose 1
        tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath=~/.ssh/tramp-%%r@%%h:%%p -o ControlPersist=600")
  (setq tramp-connection-timeout 10))
(provide 'tramp-config)

