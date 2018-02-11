(require 'hideif)

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq hide-ifdef-shadow t)
            (setq hide-ifdef-mode t)
            (hide-ifdefs)
            ))

(setq hide-ifdef-initially t)
(setq hide-ifdef-block t)


(provide 'init-hideif)
