;;; Character sets

(defcustom sanityinc/force-default-font-for-symbols nil
  "When non-nil, force Emacs to use your default font for symbols."
  :type 'boolean)

(defun sanityinc/maybe-use-default-font-for-symbols ()
  "Force Emacs to render symbols using the default font, if so configured."
  (when sanityinc/force-default-font-for-symbols
    (set-fontset-font "fontset-default" 'symbol (face-attribute 'default :family)))
  (when (member "DejaVu Sans" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "DejaVu Sans-12"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans-12")))
  )

(add-hook 'after-init-hook 'sanityinc/maybe-use-default-font-for-symbols)


;;; Changing font sizes

;; 表格中英文对齐
;; 英文设置
;; (custom-set-faces
;;   custom-set-faces was added by Custom.
;;   If you edit it by hand, you could mess it up, so be careful.
;;   Your init file should contain only one such instance.
;;   If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#ffffff" :foreground "#000000"
;;  '(default ((t (:inherit nil :stipple nil
;;                          :inverse-video nil :box nil :strike-through nil :overline nil
;;                          :underline nil :slant normal :weight normal :height 120
;;                          :width normal :foundry "unknown" :family "Liberation Mono")))))
;; 中文设置
;; (if (and (fboundp 'daemonp) (daemonp))
;;     (add-hook 'after-make-frame-functions
;;               (lambda (frame)
;;                 (with-selected-frame frame
;;                   (set-fontset-font "fontset-default"
;;                                     'chinese-gbk "DejaVu Sans-15"))))
;;   (set-fontset-font "fontset-default" 'chinese-gbk "DejaVu Sans-15"))
;;                                     'chinese-gbk "WenQuanYi Micro Hei Mono 15"))))
;;   (set-fontset-font "fontset-default" 'chinese-gbk "WenQuanYi Micro Hei Mono 15"))

;; 让column view能够在daemon模式下正常显示
;; (defun wl-org-column-view-uses-fixed-width-face ()
;;   copy from org-faces.el
;;   (when (fboundp 'set-face-attribute)
;;     Make sure that a fixed-width face is used when we have a column table.
;;     (set-face-attribute 'org-column nil
;;                         :height (face-attribute 'default :height)
;;                         :family (face-attribute 'default :family))))
;; (when (and (fboundp 'daemonp) (daemonp))
;;  (add-hook 'org-mode-hook 'wl-org-column-view-uses-fixed-width-face))


(require-package 'default-text-scale)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)


(defun sanityinc/maybe-adjust-visual-fill-column ()
  "Readjust visual fill column when the global font size is modified.
This is helpful for writeroom-mode, in particular."
  (if visual-fill-column-mode
      (add-hook 'after-setting-font-hook 'visual-fill-column--adjust-window nil t)
    (remove-hook 'after-setting-font-hook 'visual-fill-column--adjust-window t)))

(add-hook 'visual-fill-column-mode-hook
          'sanityinc/maybe-adjust-visual-fill-column)



(provide 'init-fonts)
