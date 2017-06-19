(require-package 'org-pomodoro)

    (custom-set-variables
     '(org-pomodoro-format "•%s")
     '(org-pomodoro-short-break-format "•%s") )

(add-hook 'org-pomodoro-finished-hook
          (lambda ()
            (mukhali/terminal-notifier-notify "Pomodoro" "time-for-relax")))
(add-hook 'org-pomodoro-short-break-finished-hook
          (lambda ()
            (mukhali/terminal-notifier-notify "Break-Completed" "ready-for-another?")))

(provide 'init-pomodoro)
