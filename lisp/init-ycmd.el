(require-package 'ycmd)

;; ycmd
(add-hook 'c++-mode-hook 'ycmd-mode)
(set-variable 'ycmd-server-command '("python" "/home/wxy/Tools/ycmd/ycmd")) ;; ycmd安装路径
(set-variable 'ycmd-global-config "/home/.emacs/ycm/.ycm_extra_conf.py")
(set-variable 'ycmd-extra-conf-whitelist
            '("/home/.emacs/ycm/*")
            '("/home/web/source/*"))


(defun ycmd-setup-completion-at-point-function ()
  "Setup `completion-at-point-functions' for `ycmd-mode'."
  (add-hook 'completion-at-point-functions
            #'ycmd-complete-at-point nil :local))

(add-hook 'ycmd-mode #'ycmd-setup-completion-at-point-function)

(company-ycmd-setup)


(provide 'init-ycmd)
