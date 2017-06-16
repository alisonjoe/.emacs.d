;; cpplint
(setq cpplint (concat "python " (file-truename "~/.emacs.d/tools/cpplint/cpplint.py")))
;; (setq flag " --verbose=2 --linelength=80 --output=vs7 --counting=detailed ")
(setq flag " --verbose=2 --linelength=80 --output=vs7  --counting=detailed --filter=-build/include ")


(defun cpplint-current_outfile()
  (interactive)
  (let ((file (file-name-nondirectory buffer-file-name)))
    (let 'tmp (compile (format "%s %s %s 2>&1 | tee %s.cpplintOut "
                     cpplint
                     flag
                     file
                     file
                     (file-name-sans-extension file)))))
  )



;; 需要打开文件才能调用，不然获取不到path
(defun cpplint-dire_outfile()
  (interactive)
  (setq src_path (file-name-directory buffer-file-name))
  (compile (format "%s %s %s*.* 2>&1 | tee all.cpplintOut "
                   cpplint
                   flag
                   src_path ))
  )

(defun cpplint-current()
  (interactive)
  (let ((file (file-name-nondirectory buffer-file-name)))
    (let 'tmp (compile (format "%s %s %s "
                     cpplint
                     flag
                     file
                     file
                     (file-name-sans-extension file)))))
  )



;; 需要打开文件才能调用，不然获取不到path
(defun cpplint-dire()
  (interactive)
  (setq src_path (file-name-directory buffer-file-name))
  (compile (format "%s %s %s*.* "
                   cpplint
                   flag
                   src_path )) > log
  )

write-contents-functions()
(provide 'init-cpplint)
