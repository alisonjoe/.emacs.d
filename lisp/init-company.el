(require-package 'company)

(defun company-my-backend (command &optional arg &rest ignored)
  (pcase command
    (`prefix (company-grab-symbol))
    (`candidates (list "foobar" "foobaz" "foobarbaz"))
    (`meta (format "This value is named %s" arg))))
;; 自动补全
(global-company-mode t)

;;(setq company-backends '(company-elisp 
;;                         company-ropemacs
;;                         company-gtags
;;                         company-dabbrev-code
;;                         company-keywords
;;                         company-files 
;;                         company-dabbrev))

(provide 'init-company)
