;; set tramp windows需要plink支持ssh功能

(require-package 'tramp)
(cond
 ((eq system-type 'windows-nt)
  (setq tramp-default-method "plink"
        tramp-password-end-of-line "\r\n"))
 ((eq system-type 'gnu/linux)
  (setq tramp-default-method "ssh")))
(setq tramp-default-user "alisonjoe"
	 tramp-default-host "192.168.19.129")
(setq password-cache-expiry 36000)


(provide 'init-tramp)