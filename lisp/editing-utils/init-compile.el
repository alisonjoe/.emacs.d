;; supply some shortcut for compilation
;; the compilation commands alist : (FILETYPE COMMAND-LIST)
(setq my-compilation-commands
      '((("c" ) . ("clang -Wall" "gcc -Wall"))
        (("cpp" "c++" "CPP" "C" "cc" ) . ("clang++ -Wall -std=c++11" "g++ -Wall -std=c++11"))))

;; 粘贴自动格式化代码
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
      (and (not current-prefix-arg)
           (member major-mode
                   '(emacs-lisp-mode
                     lisp-mode
                     clojure-mode
                     scheme-mode
                     haskell-mode
                     ruby-mode
                     rspec-mode
                     python-mode
                     c-mode
                     c++-mode
                     objc-mode
                     latex-mode
                     js-mode
                     plain-tex-mode))
           (let ((mark-even-if-inactive transient-mark-mode))
             (indent-region (region-beginning) (region-end) nil))))))

;; 设置编码
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)


;; get the right command according to the file type
(defun get-compile-cmd ()
  "decide the compilation command according to the file's type"
  (interactive)
  (let* ((file-type (file-name-extension (buffer-name)))
         (command-name (assoc-default file-type
                                      my-compilation-commands
                                      (lambda (x k)
                                        (member k x))
                                      '("make -k")))
         (full-name (buffer-name)))
    (if command-name
        (setq command-name (car command-name))
      (setq command-name "make -k"))
    (setq compile-command
          (concat command-name " " full-name))))


;; set shortcut to F5
(global-set-key
 [f5]
 '(lambda ()
    (interactive)
    (save-some-buffers)
    (get-compile-cmd)
    (compile
     (compilation-read-command compile-command))))

;; 删除行末空格
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 格式化代码
(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

;;绑定到F9键
(global-set-key [f9] 'indent-buffer)

(provide 'init-compile)
