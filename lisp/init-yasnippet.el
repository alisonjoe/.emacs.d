(require-package 'yasnippet)
(require 'yasnippet)
;; make Ctrl-c k the only trigger key for yas
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/Mr.Lai/"                 ;; personal snippets
         "~/.emacs.d/elpa/yasnippet-20160504.935/snippets" ;;defualt 需要对应安装完的版本号
        ;;"/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
        ;;"/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
        ;;"/path/to/yasnippet/snippets"         ;; the default collection
        ))

(yas-global-mode 1)



(provide 'init-yasnippet)



