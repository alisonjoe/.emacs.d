;; init.el
;; -*- lexical-binding: t -*-

(setq debug-on-error t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking)
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
;; (let ((normal-gc-cons-threshold (* 20 1024 1024))
;;       ((defconst *is-a-mac* (eq system-type 'darwin))init-gc-cons-threshold (* 128 1024 1024)))
;;   (setq(defconst *is-a-mac* (eq system-type 'darwin)) gc-cons-threshold init-gc-cons-threshold)
;;   (add-hook 'after-init-hook
;;          (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))
;;----------------------------------------------------------------------------
;;----------------------------------------------------------------------------

;; (when (eq system-type 'windows-nt)
;;   (setq-default comint-process-echoes 'on))

;; ----------------------------------------------------------------------
;; load init lisp
(require 'init-utils)
(require 'init-elpa)
(require 'init-editing-utils)
(require 'init-org)
(require 'init-agenda)
(require 'init-multiple-cursors)
(require 'init-themes)
(require 'init-window-numbering)
(require 'init-helm)
(require 'init-dired)
(require 'init-hungry-delete)
(require 'init-swiper)
(require 'init-company)
(require 'init-powerline)
(require 'init-projectile)
(require 'init-find-file-in-project)
(require 'init-magit)
(require 'init-fill-column)
(require 'init-flycheck)
(require 'init-flymake-cppcheck)

;;; (require 'init-session)
;; (require 'init-pomodoro)  ;; org-pomodoro
;; (require 'init-sql)

;; (require 'init-fonts)
;; (require 'init-google-c-style)
;; (require 'init-cpplint)

;; (require 'init-exec-path)
;; (require 'init-ctable)

;; (require 'init-yasnippet)

;; (require 'init-dynamic)
;; (require 'init-mew)
;; (require 'init-ac-source)
;; (require 'init-auto-complete-c-headers)

;; (require 'init-org-edit-latex)
;; ;;; (require 'init-org2pdf)
;; (when (eq system-type 'windows-nt)
;;   (require 'init-nyan)
;;   (require 'init-org-download))
;; (when (eq system-type 'darwin)
;; 		(require 'init-nyan)
;;         (require 'init-org-download))

;; (require 'init-ggtags)
;; (require 'init-popup)
;; (require 'init-unicad)



;; (require 'init-markdown)

;; (require 'init-xmlrpc)
;; (require 'init-confluence)
;; (require 'init-recentf-ext)
;; (require 'init-imenu)
;; (require 'init-tramp)
;; ;; (require 'init-ctags)
;; ;; (require 'init-ycmd)
;; (require 'init-go-autocomplete)
;; (require 'init-erlang)
;; ----------------------------------------------------------------------



(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.autosaves/" t))))
 '(backup-directory-alist (quote ((".*" . "~/.backups/"))))
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("551596f9165514c617c99ad6ce13196d6e7caa7035cea92a0e143dbe7b28be0e" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "55d31108a7dc4a268a1432cd60a7558824223684afecefa6fae327212c40f8d3" default)))
 '(display-time-mode t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family #("微软雅黑" 0 4 (charset chinese-gbk)) :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
