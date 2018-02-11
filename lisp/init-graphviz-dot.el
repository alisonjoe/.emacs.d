(require-package 'graphviz-dot-mode)

(load "graphviz-dot-mode.el" nil t t)

(add-to-list 'graphviz-dot-mode)
(add-hook 'find-file-hook (lambda()
                            (if (string= "dot" (file-name-extension
                                                 buffer-file-name))
                              (progn
                                (message "Enabling Setings for dot-mode")
                                (setq fill-column 1000)
                                (base-auto-pair)
                                (local-set-key (kbd "<C-f6>") 'compile)
                                )
                              )))


(provide 'init-graphviz-dot)
