;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; 打开最近打开过的文件
(global-set-key (kbd "\C-x \C-r") 'recentf-open-files)

;; swiper counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; git 项目查找
(global-set-key (kbd "C-c p f") 'counsel-git)
;; 查找
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)
;;  在相应的搜索buff下按c-c c-e进入可以编辑状态

;; 快速查找函数和变量和键值
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 打开org日程管理
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)

;; 上下查找
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  )

;; If you want to configure a keybinding (e.g., C-c z), add the following
(global-set-key (kbd "C-c z") 'reveal-in-osx-finder)

;; 格式化快捷键
(global-set-key (kbd "<f7>") 'indent-buffer)

;; 
(global-set-key (kbd "M-s o") 'occur-dwim)

;; 多处同时编辑
;; (global-set-key (kbd "M-s e") 'iedit-mode)

;; 选中区域
(global-set-key (kbd "C-=") 'er/expand-region)

;; auto yasnippet
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "C-y") #'aya-expand)

;; 适应shell的用法
(global-set-key (kbd "C-w") 'backward-kill-word)

;; evil-leader
(evil-leader/set-key
   "e" 'find-file
   "b" 'switch-to-buffer
   "k" 'kill-buffer
   "1" 'select-window-1
   "2" 'select-window-2
   "3" 'select-window-3
   "4" 'select-window-4
   "w/" 'split-window-right
   "w-" 'split-window-below)

(provide 'init-keybd)
