(require-package 'company)
(require-package 'company-ycmd)

(add-hook 'c++-mode-hook 'global-company-mode)

(defun company-my-backend (command &optional arg &rest ignored)
  (pcase command
    (`prefix (company-grab-symbol))
    (`candidates (list "foobar" "foobaz" "foobarbaz"))
    (`meta (format "This value is named %s" arg))))
;; 自动补全
(global-company-mode t)

(provide 'init-company)
