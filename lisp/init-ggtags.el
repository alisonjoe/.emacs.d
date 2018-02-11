(require-package 'ggtags)

(setq gtags-suggested-key-mapping t)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(provide 'init-ggtags)
