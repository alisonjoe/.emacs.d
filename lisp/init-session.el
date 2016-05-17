(require-package 'session)
(add-to-list 'load-path "~/.emacs/session")
(add-hook 'after-init-hook 'session-initialize)

(provide 'init-session)
