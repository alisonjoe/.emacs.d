(require-package 'nyan-mode)

(when nyan-mode (list (nyan-create)))
(nyan-mode t);;启动nyan-mode
(nyan-start-animation);;开始舞动吧（会耗cpu资源）

(provide 'init-nyan)
