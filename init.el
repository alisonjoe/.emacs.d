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

;; 判断系统进行不同设置
;; (when (eq system-type 'windows-nt)
;;   (setq-default comint-process-echoes 'on))

;; 下面的每一个需要被require的feature都对应一个lisp/目录下的同名elisp文件，例如
;; init-elpa.el、init-utils.el
;; ----------------------------------------------------------------------
;; 为加载初始化文件提供的一些自定义函数和宏
(require 'init-utils)  ;; el 加载顺序
;; 加载elpa，主要定义了require-package函数
(require 'init-elpa)  ;; 软件仓库
(require 'init-session)  ;; 配合desktop使用，保存关闭前状态
(require 'init-themes)  ;; 配色
(require 'init-editing-utils)  ;; 个人习惯配置
(require 'init-hungry-delete)  ;; 删除多余空格
(require 'init-swiper)  ;; 正则表达式查找
(require 'init-helm)   ;; 命令补全
(require 'init-dired)  ;; dired模式
(require 'init-agenda)  ;; load org-agenda-file
(require 'init-org)  ;; org-mode
(require 'init-pomodoro)  ;; org-pomodoro
(require 'init-window-numbering)  ;; 窗口跳转
(require 'init-company)  ;; 自动补全，待整理
(require 'init-sql)  ;; sql模式
(require 'init-projectile)  ;; 项目管理
(require 'init-find-file-in-project)
(require 'init-fonts)  ;; 设置字体
(require 'init-powerline)
(require 'init-google-c-style)
(require 'init-cpplint)  ;; google cpplint
(require 'init-flycheck)
(require 'init-exec-path)  ;; 设置shell 路径
(require 'init-ctable)
(require 'init-magit)
(require 'init-yasnippet)
(require 'init-fill-column)  ;; 显示右边的换行提示
(require 'init-dynamic)  ;; 加载动态库
(require 'init-mew)  ;; 邮件
(require 'init-ac-source)
(require 'init-auto-complete-c-headers)  ;; 头文件提示
(require 'init-flymake-cppcheck)  ;; cppcheck
(when (eq system-type 'windows-nt)
  (require 'init-nyan)
  (require 'init-org-download))
(when (eq system-type 'darwin)
  (require 'init-nyan)
  (require 'init-org-download))


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
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("55d31108a7dc4a268a1432cd60a7558824223684afecefa6fae327212c40f8d3" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82e02b87e45ef7bee5d900ff4ebc12956ecdc9d797d6905f62758a7f2198305c" "db08eb1e43f351490cfffd720db90600dd92d5cdf311f74350532ba71ae65c48" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(flycheck-c/c++-googlelint-executable "~/.emacs.d/tools/cpplint/cpplint.py")
 '(flycheck-googlelint-filter "-whitespace,+whitespace/braces")
 '(flycheck-googlelint-linelength "120")
 '(flycheck-googlelint-root "project/src")
 '(flycheck-googlelint-verbose "3")
 '(flymake-cppcheck-command cppcheck)
 '(flymake-cppcheck-enable "warning,performance,information,style")
 '(flymake-cppcheck-location (quote tempdir))
 '(org-pomodoro-format "•%s")
 '(org-pomodoro-short-break-format "•%s")
 '(package-selected-packages
   (quote
    (smex powerline find-file-in-project projectile hungry-delete multiple-cursors autumn-light-theme magit ssh ssh-agency ido-gnus org default-text-scale yasnippet atom-dark-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme tabbar sql-indent markdown-mode exec-path-from-shell dired+ pos-tip fuzzy auto-complete-clang ac-math flex-isearch undo-tree switch-window page-break-lines whole-line-or-region expand-region hlinum autopair diminish help-fns+)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
