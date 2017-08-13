;; 主要提供一个宏after-load，供后续的各初始化函数使用，来源自Purcell，目的是把一些互相依赖
;; 的feature的加载顺序理顺，例如feature A依赖于feature B，则可以写成(after-load 'B 'A)
;; 这样如果发生在B之前reeuire了A也不会影响正常启动。

;; afeter-load
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(provide 'init-utils)
