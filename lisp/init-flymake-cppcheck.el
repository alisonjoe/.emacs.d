(require-package 'flymake-cppcheck)


(custom-set-variables
   '(flymake-cppcheck-command "path/cppcheck"))

(add-hook 'c-mode-hook 'flymake-cppcheck-load)
(add-hook 'c++-mode-hook 'flymake-cppcheck-load)

(custom-set-variables
   '(flymake-cppcheck-enable "all"))

(custom-set-variables
   '(flymake-cppcheck-enable "warning,performance,information,style"))

(custom-set-variables
   '(flymake-cppcheck-location 'tempdir))

(setq cppcheck "path/cppcheck")
;; (setq cppcheck_flag " --std=c99 --std=posix file.c  -j4 --enable=all ")
(setq cppcheck_flag " --std=c99 --std=posix file.c --enable=all ")

(defun cppcheck-current()
  (interactive)
  (let ((file (file-name-nondirectory buffer-file-name)))
    (let 'tmp (compile (format "%s %s %s "
                     cppcheck
                     cppcheck_flag
                     file
                     file
                     (file-name-sans-extension file)))))
  )

;; 需要打开文件才能调用，不然获取不到path
(defun cppcheck-dire()
  (interactive)
  (setq src_path (file-name-directory buffer-file-name))
  (compile (format "%s %s %s*.* "
                   cppcheck
                   cppcheck_flag
                   src_path )) > log
  )


(provide 'init-flymake-cppcheck)
