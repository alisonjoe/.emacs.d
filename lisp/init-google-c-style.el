;; set c/c++ style

(require-package 'google-c-style)

(add-hook 'c-mode-common-hook 'google-set-c-style)

(add-hook 'c-mode-common-hook 'google-make-newline-indent)


(provide 'init-google-c-style)
