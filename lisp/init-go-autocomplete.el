(require-package 'go-mode)
(require-package 'go-autocomplete)

(defun go_test()
  (interactive)
  (let ((file (file-name-nondirectory buffer-file-name)))
    (let 'tmp (compile (format "go run %s "
                     file
                     file
                     (file-name-sans-extension file)))))
  )

(global-set-key [f7] 'go_test)
(require 'auto-complete-config)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(provide 'init-go-autocomplete)
