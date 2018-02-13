;; set projectile

(require-package 'projectile)

(setq projectile-enable-caching t)

(if (eq system-type 'windows-nt)
    (add-to-list 'load-path "E:\WorkSpace")
  (add-to-list 'load-path "~/WorkSpace"))

(require 'projectile)


(provide 'init-projectile)
