;; Time-stamp: <最后更新时间: 2018-02-12 18:13:41 laihongshu>
(add-to-list 'load-path (expand-file-name "lisp/editing-utils" user-emacs-directory))
;; some default value

;; 开启行号
(global-linum-mode t)
;; 高亮行
(global-hl-line-mode t)

;; 标题栏，显示"buffer的名字@Emacs"
(setq frame-title-format "%b@Mr.Lai.who")

;; 设置M-/作为标志位，默认C-@来setmark,C-@不太好用
(global-set-key (kbd "M-/") 'set-mark-command)

;; 改变Emacs要你回答yes的行为。按y或空格键表示yes，n表示no。
(fset 'yes-or-no-p 'y-or-n-p)

;; 禁止在鼠标点击的地方插入剪贴板内容
(setq mouse-yank-at-point t)

;; 设置光标不闪
(blink-cursor-mode t)
;;设置光标为线条状
(setq-default cursor-type 'bar)

;; 所有模式中都自动填充
(setq-default auto-fill-function 'do-auto-fill)

;; ----------------- 显示日期时间--------------------
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)
(display-time)

;; 时间戳设置(time-stamp)，设定文档上次保存的信息
;; 只要里在你得文档里有Time-stamp:的设置，就会自动保存时间戳
;; 启用time-stamp
(setq time-stamp-active t)
;; 去掉time-stamp的警告？
(setq time-stamp-warn-inactive t)

;; Time-stamp 设定文档上次保存的信息-------------------------
;; 需在文档的前8行中加入关键字如: Time-stamp: <> 或 Time-stamp: ""，便会自动保存时间戳
;; 使用中文需要写成: Time-stamp: <最后更新时间:> 或 Time-stamp: "最后更新时间:"
(add-hook 'write-file-hooks 'time-stamp)
;; (setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")
(setq time-stamp-start "最后更新时间:[     ]+\\\\?")
(setq time-stamp-end: "\n")
(setq time-stamp-format: "%:y-%:m-%:d ")

;; Highlight function
;; (require 'which-func)
;; (which-func-mode t)

;; go-to-char like vi f char
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
                     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
(define-key global-map (kbd "C-c f") 'wy-go-to-char)  ;; chang C-c a to bind C-c f

;;---------------- Personal Info. ----------------------
(setq user-full-name "alisonjoe")
(setq track-eol t) ; 当光标在行尾上下移动的时候，始终保持在行尾

;; set fill column
(setq-default fill-column 80)

;; 不用 TAB 字符来indent, 这会引起很多奇怪的错误。
;; 编辑 Makefile 的时候也不用担心，因为 makefile-mode
;; 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的
;; 设置tab为4个空格的宽度，而不是原来的2
(setq-default indent-tabs-mode nil)
(setq tab-stop-list ())

(setq c-basic-offset 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;; set the default file path
;; if succ use first,  else use second.
(if (eq system-type 'windows-nt)
  (setq default-directory "e:/WorkSpace/")
  (setq default-directory "~/WorkSpace"))

(global-set-key (kbd "C-c C-c c") '(lambda() (interactive) (load-file "~/.emacs.d/init.el")))

(setq load-path
      (cons (expand-file-name "~/.emacs.d/lisp") load-path))

;; auto-revert
;; (global-auto-revert-mode)
;; (setq global-auto-revert-non-file-buffers t
;;       auto-revert-verbose t)

;; enable auto-pairing
(require 'init-autopair)
(diminish 'autopair-mode)

;; some personal key bindings
(global-set-key (kbd "C-c r") 'replace-string)

;; newline behavior
(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "<S-return>") 'sanityinc/newline-at-end-of-line)

;; 关闭emacs默认打开页
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;; change yes-or-no to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; display time
(display-time-mode t)
(setq display-time-24hr-format t)

;; visual line
(global-visual-line-mode t)
;; (diminish 'global-visual-line-mode)
(diminish 'visual-line-mode)

;; expand-region
(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; enable uppercase and lowercase transform for region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; whole-line-or-region-mode
(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)
(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

;; enable cua mode without prefix key
(cua-selection-mode t)

;; use page-break-line to handle the ^L page-breaking symbol
(require-package 'page-break-lines)
(global-page-break-lines-mode)
(diminish 'page-break-lines-mode)


;; enable subword-mode
;; (global-subword-mode t)


;; 备份文件
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.autosaves/" t)
(make-directory "~/.backups/" t)
; put files
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.autosaves/" t)))
  '(backup-directory-alist '((".*" . "~/.backups/"))))

;; switch-window
(require 'init-switch-window)
;; Set "C-x p" to select the previous window
(defun other-window-backward (&optional n)
  "Select the Nth previous window"
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))
(global-set-key "\C-xp" 'other-window-backward)

;; undo-tree
(require 'init-undo-tree)
(diminish 'undo-tree-mode)

;; outline-minor-mode
(require 'init-outl-minor)

;; use C-u C-u C-s/r to trigger the flexible search action
(require 'init-flex-isearch)

;; user-info
(require 'init-userinfo)

;; gettime
(require 'init-gettime)

;; set some compilation shortcuts
(require 'init-compile)

;; spell checking
;; (when (executable-find "hunspell")
;;   (setq-default ispell-program-name "hunspell")
;;   (setq ispell-really-hunspell t)
;;   (require 'init-flyspell))
(when (executable-find "aspell")
  (setq-default ispell-program-name "aspell")
  (setq ispell-really-aspell t)
  (require 'init-flyspell))

;; ,号后自动加空格
(global-set-key (kbd ",")
                #'(lambda ()
                    (interactive)
                    (insert ", ")))


(provide 'init-editing-utils)
