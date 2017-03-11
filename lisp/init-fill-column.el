(require-package 'fill-column-indicator)

;; 将fci模式启用为全局次模式
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))

;; 在文本和编程模式下启用fci模式，但不是特殊的缓冲区，dired，shell等
(define-globalized-minor-mode global-fci-mode fci-mode
                              (lambda ()
                                (if (and
                                      (not (string-match "^\*.*\*$" (buffer-name)))
                                      (not (eq major-mode 'dired-mode)))
                                  (fci-mode 1))))



(show-paren-mode t)
(setq show-paren-style 'expression)


(setq-default fci-rule-column 80)
(setq fci-handle-truncate-lines nil)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
(defun auto-fci-mode (&optional unused)
  (if (> (window-width) fci-rule-column)
    (fci-mode 1)
    (fci-mode 0))
  )
(add-hook 'after-change-major-mode-hook 'auto-fci-mode)
(add-hook 'window-configuration-change-hook 'auto-fci-mode)

(setq fci-rule-width 5)
(setq fci-rule-color "darkblue")

(global-fci-mode 1)

(provide 'init-fill-column)
