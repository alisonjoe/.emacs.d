;; Author: Mr.Lai
;; Email:  Mr.Lai.who@gmail.com
;; 主要是个人工作需求而对emacs的一些配置，所有的配置文件都放在~/.emacs.d/目录下，
;; emacs启动时会自动执行该目录下的init.el文件。利用emacs的Feature机制，可以很方
;; 便的把具体的初始化工作按类别分在其余文件中。

;; init.el
;; -*- lexical-binding: t -*-

(setq debug-on-error t)

;;把目录lisp/添加到搜索路径中

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking)  ;; 测量启动时间
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

;; 判断系统进行不同设置
;; (when (eq system-type 'windows-nt)
;;   (setq-default comint-process-echoes 'on))

;; 下面的每一个需要被require的feature都对应一个lisp/目录下的同名elisp文件，例如
;; init-elpa.el、init-utils.el
;; ----------------------------------------------------------------------
;; 为加载初始化文件提供的一些自定义函数和宏
(require 'init-utils)  ;; el 加载顺序
;; 加载elpa，主要定义了require-package函数
(require 'init-elpa)
(require 'init-editing-utils)
(require 'init-multiple-cursors)
(require 'init-themes)
(require 'init-window-numbering)
(require 'init-helm)

;; ; (require 'init-session)  ;; 配合desktop使用，保存关闭前状态

;; (require 'init-hungry-delete)  ;; 删除多余空格
;; (require 'init-swiper)  ;; 正则表达式查找

;; (require 'init-dired)  ;; dired模式
;; (require 'init-agenda)  ;; load org-agenda-file
;; (require 'init-org)  ;; org-mode
;; (require 'init-pomodoro)  ;; org-pomodoro

;; (require 'init-company)  ;; 自动补全，待整理
;; (require 'init-sql)  ;; sql模式
;; (require 'init-projectile)  ;; 项目管理
;; (require 'init-find-file-in-project)
;; (require 'init-fonts)  ;; 设置字体
;; (require 'init-powerline)
;; (require 'init-google-c-style)
;; (require 'init-cpplint)  ;; google cpplint
;; (require 'init-flycheck)
;; (require 'init-exec-path)  ;; 设置shell 路径
;; (require 'init-ctable)
;; (require 'init-magit)
;; (require 'init-yasnippet)
;; (require 'init-fill-column)  ;; 显示右边的换行提示
;; (require 'init-dynamic)  ;; 加载动态库
;; (require 'init-mew)  ;; 邮件
;; (require 'init-ac-source)
;; (require 'init-auto-complete-c-headers)  ;; 头文件提示
;; (require 'init-flymake-cppcheck)  ;; cppcheck
;; (require 'init-org-edit-latex)  ;; cppcheck
;; ;;; (require 'init-org2pdf)  ;; cppcheck
;; (when (eq system-type 'windows-nt)
;;   (require 'init-nyan)
;;   (require 'init-org-download))
;; (when (eq system-type 'darwin)
;; 		(require 'init-nyan)
;;         (require 'init-org-download))

;; (require 'init-ggtags)
;; (require 'init-popup)
;; (require 'init-unicad)  ;; 自动解析编码



;; (require 'init-markdown)

;; (require 'init-xmlrpc)
;; (require 'init-confluence)
;; (require 'init-recentf-ext)
;; (require 'init-imenu)
;; (require 'init-tramp)
;; ;; (require 'init-ctags)
;; ;; (require 'init-ycmd)  ;; 需要安装ycmd
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
