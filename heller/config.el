;; (global-linum-mode t)

;;格式化整个文件函数
(defun indent-whole ()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))


(defun heller/my-mc-mark-next-like-this ()
  (interactive)
  (if (region-active-p)
      (mc/mark-next-like-this 1)
    (er/expand-region 1)))




;; 绑定快捷键
;; (global-set-key (kbd "s-d") 'heller/my-mc-mark-next-like-this)

(spacemacs/set-leader-keys "sd" 'heller/my-mc-mark-next-like-this)
(spacemacs/set-leader-keys "oh" 'hs-hide-block)
(spacemacs/set-leader-keys "os" 'hs-show-block)



(global-set-key [f5] 'erlang-compile)
(global-set-key [f8] 'helm-projectile-find-file)
(global-set-key [f9] 'helm-swoop)
(global-set-key [f10] 'indent-whole)
(global-set-key [f11] 'helm-buffers-list)
(global-set-key [f12] 'save-buffer)




