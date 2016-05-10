;; set c/c++ style

(require-package 'cc-mode)
(require-package 'google-c-style)

;;(defun my-build-tab-stop-list (width)
;;  (let ((num-tab-stops (/ 80 width))
;;    (counter 1)
;;    (ls nil))
;;    (while (<= counter num-tab-stops)
;;      (setq ls (cons (* width counter) ls))
;;      (setq counter (1+ counter)))
;;    (set (make-local-variable 'tab-stop-list) (nreverse ls))))
;;(defun my-c-mode-common-hook ()
;;  (c-set-style "google")
;;  (setq tab-width 2) ;; change this to taste, this is what K&R uses <img src="https://s.w.org/images/core/emoji/72x72/1f642.png" alt="" class="emoji" draggable="false">
;;  (my-build-tab-stop-list tab-width)
;;  (setq c-basic-offset tab-width)
;;  (setq indent-tabs-mode nil) ;; force only spaces for indentation
;;  (local-set-key "\C-o" 'ff-get-other-file)
;;  (c-set-offset 'substatement-open 0)
;;  (c-set-offset 'arglist-intro c-lineup-arglist-intro-after-paren)
;;  )
;;;; google sytle is defined in above function
;;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;;(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)
;;
;;;; Adopt by Xiaowei Zhan 2011 from .emacs
;;(require 'google-c-style)
;;(defun emacs-format-function ()
;;  "Format the whole buffer."
;;  (setq tab-width 2) ;; change this to taste, this is what K&R uses <img src="https://s.w.org/images/core/emoji/72x72/1f642.png" alt="" class="emoji" draggable="false">
;;  (setq c-basic-offset tab-width)
;;  (c-set-offset 'substatement-open 0)
;;  ;; next line is strange, I copied it from .emacs, but it cannot find c-lineup-arglist-intro-after-paren
;;  ;; however, disable this line seems working as well.
;;  ;;(c-set-offset 'arglist-intro c-lineup-arglist-intro-after-paren) 
;;  (indent-region (point-min) (point-max) nil)
;;  (untabify (point-min) (point-max))
;;  (save-buffer)
;;  )

(defun indent-buffer ()
"Indent the whole buffer."
(interactive)
(save-excursion
 
(indent-region (point-min) (point-max) nil)))
 
;;绑定到F7键
(global-set-key [f7] 'indent-buffer)

(provide 'init-google-c-style)

