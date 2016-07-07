(require-package 'ycmd)

;; ycmd
(add-hook 'c++-mode-hook 'ycmd-mode)
(set-variable 'ycmd-server-command '("python" "/home/alisonjoe/Tools/ycmd/ycmd/")) ;; ycmd安装路径
(set-variable 'ycmd-global-config "~/.emacs.d/ycm/.ycm_extra_conf.py")
(set-variable 'ycmd-extra-conf-whitelist
            '("~/.emacs.d/ycm/*")
            '("~/WorkSpace/bigfan_broka/*"))

(defun ycmd-setup-completion-at-point-function ()
  "Setup `completion-at-point-functions' for `ycmd-mode'."
  (add-hook 'completion-at-point-functions
            #'ycmd-complete-at-point nil :local))

(set-variable 'ycm_global_ycm_extra_conf "~/.emacs.d/ycm/.ycm_extra_conf.py")

(add-hook 'ycmd-mode #'ycmd-setup-completion-at-point-function)

(company-ycmd-setup)


(provide 'init-ycmd)
