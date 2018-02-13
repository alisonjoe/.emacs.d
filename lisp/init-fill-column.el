(require-package 'fill-column-indicator)

;; (define-globalized-minor-mode global-fci-mode
;;   fci-mode (lambda () (fci-mode 1)))

(define-globalized-minor-mode global-fci-mode
  fci-mode (lambda ()
             (if (and (not (string-match "^\*.*\*$" (buffer-name)))
                      (not (eq major-mode 'dired-mode)))
                 (fci-mode 1))))

(show-paren-mode t)
(setq show-paren-style 'expression)

(defun auto-fci-mode (&optional unused)
  (if (> (window-width) fci-rule-column)
    (fci-mode 1)
    (fci-mode 0))
  )

(add-hook 'after-change-major-mode-hook 'auto-fci-mode)
(add-hook 'window-configuration-change-hook 'auto-fci-mode)

(setq-default fci-rule-column 80)
(setq fci-handle-truncate-lines nil)

(setq fci-rule-width 2)
(setq fci-rule-color "darkblue")

(global-fci-mode t)

(provide 'init-fill-column)
