(require-package 'session)
(add-to-list 'load-path "~/.emacs/session")
(add-hook 'after-init-hook 'session-initialize)


(session-jump-to-last-change)
(session-initialize)
;; session will save if any frame is deleted.
(add-hook 'delete-frame-functions
         (lambda (frame)
           (session-save-session t)
           ))


(provide 'init-session)
