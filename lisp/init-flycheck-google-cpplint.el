;; set flycheck-google-cpplint
(require-package 'flycheck-google-cpplint)

(custom-set-variables
   '(flymake-google-cpplint-command "/usr/bin/cpplint.py"))

(provide 'init-flycheck-google-cpplint)
