
;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |

(when (>= emacs-major-version 24)
  (add-to-list 'package-archives
	      ;; '("popkit" . "https://elpa.popkit.org/packages/")))
   	      ;; '("melpa" . "http://melpa.org/packages/") 
	       '("melpa" . "http://elpa.zilongshanren.com/melpa")))
;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      org-pomodoro
		      ;; web dev
		      js2-mode
		      ;; js2-refactor
		      nodejs-repl
		      web-mode
		      ;;
		      exec-path-from-shell
		      ;; --- Themes ---
		      monokai-theme
		      ;;
		      popwin
		      ;;
		      reveal-in-osx-finder
		      ;;
		      erlang
		      expand-region
		      iedit
		      helm-ag
		      flycheck
		      yasnippet
		      auto-yasnippet
		      ;;
		      evil
		      evil-leader
		      window-numbering
		      which-key
		      ) "Default packages")

;; 设置为my packages
(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS 
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; 加载主题
(load-theme 'monokai 1)

;; 开启全局 Company 补全
(global-company-mode 1)

;; 删除后面全部空格
(require 'hungry-delete)
(global-hungry-delete-mode 1)  

;; 括号双写
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

;; 设置文件的开发模式
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))
;; js2的增强工具
;; (add-hook 'js2-mode-hook #'js2-refactor-mode)

;; 执行js执行器
(require 'nodejs-repl)

;; 光标跳转到打开的buff
(require 'popwin)
(popwin-mode 1)

;; 
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; erlang
;; (require 'erlang-start)

;; org pomodoro
(require 'org-pomodoro)

;; To load at the start up
(require 'reveal-in-osx-finder)

;; 全选匹配修改
(require 'expand-region)

;; 对部分mode开起全局检查
(defvar my-mod-hooks
  '(
    js2-mode-hook
    erlang-mode-hook
    ))
(dolist (mymod my-mod-hooks)
  (add-hook mymod 'flycheck-mode))

;; yas
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(window-numbering-mode 1)

(which-key-mode 1)

(provide 'init-packages)
