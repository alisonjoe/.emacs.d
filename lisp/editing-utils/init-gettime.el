;; get day or time

;;insert-current-date
(defun insert-current-date ()
    "Insert the current date"
    (interactive "*")
    (insert (format-time-string "%Y-%m-%d" (current-time))))
    (global-set-key "\C-cd" 'insert-current-date)


;;insert-current-time
(defun insert-current-time ()
    "Insert the current time"
    (interactive "*")
    (insert (format-time-string "%H:%M:%S" (current-time))))
    (global-set-key "\C-ct" 'insert-current-time)

;;insert-current-fulltime
(defun insert-current-fulltime ()
  "Insert the current fulltime"
  (interactive "*")
  (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))
  (global-set-key "\C-ci" 'insert-current-fulltime)

(provide 'init-gettime)
