(require-package 'ctags)

(setq tags-revert-without-query t)
(global-set-key (kbd "<f7>") 'ctags-create-or-update-tags-table)

(global-set-key (kbd "M-.")  'ctags-search)

(provide 'init-ctags)
