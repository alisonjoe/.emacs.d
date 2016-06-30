;; add ac-sources for latex mode

(require-package 'ac-math)
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)

(defun ac-latex-mode-setup ()
  (setq ac-sources
        (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                ac-sources))
)

(add-hook 'latex-mode-hook 'ac-latex-mode-setup)
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

;; add ac-source for clang
(require-package 'auto-complete-clang)
(require 'auto-complete-clang)

(setq ac-clang-flags
      (append '("-std=c++11")
              (mapcar (lambda (item) (concat "-I" item))
                      (split-string
                        "
                        /usr/include/c++/4.8
                        /usr/include/x86_64-linux-gnu/c++/4.8
                        /usr/include/c++/4.8/backward
                        /usr/lib/gcc/x86_64-linux-gnu/4.8/include
                        /usr/local/include
                        /usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed
                        /usr/include/x86_64-linux-gnu
                        /usr/include
                        "
                        ))))
;; 可以设置对于不同的文件绑定不同的模式，可以用以下语句实现：
;;set *.h hpp hxx *.c *.cc *.cpp files use c++ mode
(setq auto-mode-alist
      (cons '("\\.h$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.hpp$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.hxx$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.c$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.cc$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.cpp$" . c++-mode) auto-mode-alist))


(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang) ac-sources)))

(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

(provide 'init-ac-source)


