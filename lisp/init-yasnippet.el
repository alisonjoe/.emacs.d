(require-package 'yasnippet)
(require 'yasnippet)
;; make Ctrl-c k the only trigger key for yas
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/Mr.Lai/"                 ;; personal snippets
        ;;"~/.emacs.d/elpa/yasnippet-20170310.1724/snippets"            ;; defualt 需要对应安装完的版本号
        ;;"~/.emacs.d/elpa/yasnippet"            ;; defualt 需要对应安装完的版本号
        ;;"/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
        ;;"/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
        ;;"/path/to/yasnippet/snippets"         ;; the default collection
        ))

(yas-global-mode 1)

(require-package 'dropdown-list)

(require 'dropdown-list)
(setq yas-prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt))

(provide 'init-yasnippet)
