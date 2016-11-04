;; 去掉备份文件
(setq make-backup-files nil)

;; 选中全替换
(delete-selection-mode 1)

;; 显示匹配括号
;; (define-advice show-paren-function (:round (fn) fix-show-paren-function)
;;   "Highlight enclosing paren."
;;   (cond ((looking-at-p "\\s(") (funcall (fn))
;; 	 (t (save-excursion
;; 	      (ignore-errors (backward-up-list))
;; 	      (funcall fn))))))
;; (defadvice show-paren-function (:around (fn) fix-show-paren-function)
;;   "Highlight enclosing paren."
;;   (cond ((looking-at-p "\\s(") (funcall fn))
;; 	(t (save-excursion
;; 	     (ignore-errors (backward-up-list))
;; 	     (funcall fn)))))
(show-paren-mode 1)

;; 关闭自动保存
(setq auto-save-default nil)

;;关闭烦人的出错时的提示声
(setq visible-bell t)

;;以 y/n 替代 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 打开buff utf8
(set-language-environment "UTF-8")

;; 全局定义缩写
(abbrev-mode 1)
(define-abbrev-table 'global-abbrev-table '(
					    ("dyx" "xinxinaini")
					    ))

;; 启用最近打开文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; 目录操作
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(require 'dired-x)
(setq dired-dwim-target t)
;; (put 'dired-find-alternate-file 'disabled nil)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 格式化整个buff
(defun indent-buffer ()
  "indent whold buffer"
  (interactive)
  (indent-region (point-min) (point-max)))

;; 可以扩展隐藏很多字符
(defun hidden-dos-eol ()
  "hidden same zifu"
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; 替换某些字符串
(defun remove-dos-eol ()
  "remove same zifu"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; 增强m so的获取
(defun occur-dwim ()
    "Call `occur' with a sane default."
    (interactive)
    (push (if (region-active-p)
              (buffer-substring-no-properties
               (region-beginning)
               (region-end))
            (let ((sym (thing-at-point 'symbol)))
              (when (stringp sym)
                (regexp-quote sym))))
          regexp-history)
    (call-interactively 'occur))
;; (deactivate-mark)    
;;   (call-interactively 'occur))
;; (evilified-state-evilify occur-mode occur-mode-map
;;   "RET" 'occur-mode-goto-occurrence))

;; evil
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;
(global-evil-leader-mode)

(evil-leader/set-key
   "e" 'find-file
   "b" 'switch-to-buffer
   "k" 'kill-buffer) 

(provide 'init-better-defaults)
