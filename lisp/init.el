;; my emacs config

;; 初始化包管理器
(package-initialize)

;; 配置路劲
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; (setq default-directory "~/erl_work")

;; 加载文件
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-erlang)
(require 'init-org)
(require 'init-keybd)
(require 'custom)

;; 自动生成的代码
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
(put 'dired-find-alternate-file 'disabled nil)
