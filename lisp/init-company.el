(require-package 'company)

(defun company-my-backend (command &optional arg &rest ignored)
  (pcase command
    (`prefix (company-grab-symbol))
    (`candidates (list "foobar" "foobaz" "foobarbaz"))
    (`meta (format "This value is named %s" arg))))


(provide 'init-company)
