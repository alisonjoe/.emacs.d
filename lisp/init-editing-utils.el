;; Time-stamp: <最后更新时间: 2017-06-15 19:57:53 laihongshu>

(add-to-list 'load-path (expand-file-name "lisp/editing-utils" user-emacs-directory))
;; enhanced help mechanism
(require-package 'help-fns+)
(require 'help-fns+)

;; dimish minor mode name to save mode line space
(require-package 'diminish)

;; some default value
(setq-default
 blink-cursor-delay 0.5
 blink-cursor-interval 0.4
 buffers-menu-max-size 20
 case-fold-search t
 column-number-mode t
 line-number-mode t
 compilation-scroll-output t
 delete-selection-mode t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 scroll-step 1
 scroll-margin 3
 scroll-conservatively 10000
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 visible-bell t
 scroll-bar-mode nil
 tool-bar-mode nil)

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
(setq time-stamp-format: "%:y年%:m月%:d日")

;; 用来显示当前光标在哪个函数
(require 'which-func)
(which-func-mode t)

;; go-to-char 非常感谢 Oliver Scholz 提供这个函数给 我。
;; 这个函数是一个 vi 的 "f" 命令的替代品。vi的用户知道，vi有 一个特别好的命令 "f"。当你按 "fx", x 是任意一个字符时
;; 光标 就会移动到下一个 "x" 处。这之后只要按 ";"(分号)，光标就到再 下一个 "x"。
;; 举个例子说明这个命令的用途。比如我们有这样一行字，光标在 行首。
;; (setq unread-command-events (list last-input-event)))
;;                                               ^^^^^
;;我们希望迅速的到达最后那个 event 处，于是我在 vi 里按 "fe"。结果光标到了 "setq" 的那个 e 上面，这时候我接着按 ";",
;;不一会儿就到了我们想要的地方。很方便吧？可能起初不觉得，后来 你发现这真的非常好！

;;我一直觉得 Emacs 没有这样一个方便的命令，但是 Oliver 给了 我一个完美的答案：
;;有了这段代码之后，当你按 C-c a x (x 是任意一个字符) 时，光 标就会到下一个 x 处。再次按 x，光标就到下一个 x。比如 C-c a w w w w ..., C-c a b b b b b b ...
;;我觉得这个方式比 vi 的 "f" 要快。
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
(define-key global-map (kbd "C-c f") 'wy-go-to-char)

;;---------------- Personal Info. ----------------------
(setq user-full-name "alisonjoe")
(setq track-eol t) ; 当光标在行尾上下移动的时候，始终保持在行尾

;; 设置文件编码
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq-default pathname-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq locale-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq slime-net-coding-system 'utf-8-unix)
;; For my language code setting (UTF-8)
(setq current-language-environment "UTF-8")
(setq default-input-method "chinese-py")

(when (eq system-type 'windows-nt)
  (set-language-environment 'Chinese-GB)
  (set-keyboard-coding-system 'euc-cn)
  (set-clipboard-coding-system 'euc-cn)
  (set-terminal-coding-system 'euc-cn)
  (set-buffer-file-coding-system 'euc-cn)
  (set-selection-coding-system 'euc-cn)
  (modify-coding-system-alist 'process "*" 'euc-cn)
  (setq default-process-coding-system
        '(euc-cn . euc-cn))
  (setq-default pathname-coding-system 'euc-cn)
  )

;;设置默认的文档宽度
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

;; 打开emacs打开上次编辑文档
(desktop-save-mode 1)

;; set the default file path
;; if 条件成立执行第一条cmd 后面的默认为else
(if (eq system-type 'windows-nt)
  (setq default-directory "e:/WorkSpace/")
  (setq default-directory "~/WorkSpace"))


(global-set-key (kbd "C-c C-c c") '(load "~/emacs.d/init.el"))

(setq load-path
      (cons (expand-file-name "~/.emacs.d/lisp") load-path))
;; auto-revert
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose t)

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

;; multiple-cursors-mode
(require-package 'multiple-cursors)
;; multiple-cursors
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-+") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; From active region to multiple cursors:
(global-set-key (kbd "C-c c r") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-c c c") 'mc/edit-lines)
(global-set-key (kbd "C-c c e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c c a") 'mc/edit-beginnings-of-lines)

;; 备份文件
;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))
;; 不产生备份文件
(setq make-backup-files nil)
(setq-default make-backup-files nil) ;; 不产生临时文件

;; 取消自动保存
(auto-save-mode 0)

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

;; 将文件模式和文件后缀关联起来。append表示追加
;; (setq auto-mode-alist
;;     ( append
;;       '(("\\.py\\'" . python-mode)
;;         ("\\.s?html?\\'" . html-helper-mode)
;;         (" \\.asp\\'" . html-helper-mode)
;;         ("\\.phtml\\'" . html-helper-mode)
;;         ("\\.css\\'" . css-mode)
;;         )
;;         auto-mode-alist))


(provide 'init-editing-utils)
