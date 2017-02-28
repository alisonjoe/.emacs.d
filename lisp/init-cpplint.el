
(defun my-cpplint-current()
  (interactive)
  (let ((file (file-name-nondirectory buffer-file-name)))
    (compile (format "python ~/.emacs.d/tools/cpplint/cpplint.py %s"
                     file
                     (file-name-sans-extension file)))))





(provide 'init-cpplint)
