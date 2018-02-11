(require-package 'org-edit-latex)

;; 执行代码块
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '(
;;    (sh . t)
;;    (python . t)
;;    (R . t)
;;    (ruby . t)
;;    (ditaa . t)
;;    (dot . t)
;;    (octave . t)
;;    (sqlite . t)
;;    (perl . t)
;;    (C . t)
;;    ))



;; 执行代码块
(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (python . t)
    (octave . t)
    (sqlite . t)
    (latex . t)   ;; <== add latex to the list
    (ditaa . t)
    (shell . t)
    (ruby . t)
    (perl . t)
    (dot . t)
    (C . t)))

(provide 'init-org-edit-latex)
