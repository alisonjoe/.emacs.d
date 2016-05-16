;; Author: Mr.Lai
;; Email:  Mr.Lai.who@gmail.com
;; 主要是个人工作需求而对emacs的一些配置，所有的配置文件都放在~/.emacs.d/目录下，
;; emacs启动时会自动执行该目录下的init.el文件。利用emacs的Feature机制，可以很方
;; 便的把具体的初始化工作按类别分在其余文件中。

;; init.el

;;把目录lisp/添加到搜索路径中

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list
 'load-path
 (expand-file-name "lisp" user-emacs-directory))

;; 下面的每一个需要被require的feature都对应一个lisp/目录下的同名elisp文件，例如
;; init-elpa.el、init-utils.el
;; ----------------------------------------------------------------------
;; 为加载初始化文件提供的一些自定义函数和宏
(require 'init-utils)
;; 加载elpa，主要定义了require-package函数
(require 'init-elpa)
;; 一些顺手的小工具
(require 'init-editing-utils)

(require 'init-hungry-delete)  ;; 删除多余空格
(require 'init-swiper)
(require 'init-counsel)
(require 'init-company)

(require 'init-ac-source)
(require 'init-auto-complete)
(require 'init-dired)
(require 'init-exec-path)
(require 'init-markdown)
(require 'init-sql)
(require 'init-themes)
(require 'init-window-numbering)
(require 'init-yasnippet)
(require 'init-fonts)
;;(require 'init-flycheck-google-cpplint)
(require 'init-google-c-style)
(require 'init-smex)
(require 'init-helm)   ;; 不支持windows，用ido代替
;;(require 'init-ido)
;;(require 'init-tabbar)
(require 'init-xmlrpc)
(require 'init-confluence)
(require 'init-egg)
(require 'init-projectile)
(require 'init-recentf-ext)
(require 'init-org)
(require 'init-imenu)
(require 'init-tramp)
(require 'init-session)
(require 'init-mew)
(require 'init-ctable)
(require 'init-ctags)
(require 'init-find-file-in-project)
(require 'init-auto-complete-c-headers)
;; ----------------------------------------------------------------------



(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(package-selected-packages
   (quote
    (ssh ssh-agency ido-gnus org default-text-scale yasnippet atom-dark-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme tabbar sql-indent markdown-mode exec-path-from-shell dired+ pos-tip fuzzy auto-complete-clang ac-math flex-isearch undo-tree switch-window page-break-lines whole-line-or-region expand-region hlinum autopair diminish help-fns+))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
