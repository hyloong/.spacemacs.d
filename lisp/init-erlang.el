(require 'erlang-start)

(progn
  ;; explicitly run prog-mode hooks since erlang mode does is not
  ;; derived from prog-mode major-mode
  (add-hook 'erlang-mode-hook (lambda () (run-hooks 'prog-mode-hook)))
  (setq erlang-root-dir "/usr/local/lib/erlang/erts-5.10.4")
  (add-to-list 'exec-path "/usr/local/lib/erlang/erts-5.10.4/bin")
  (setq erlang-man-root-dir "/usr/local/lib/erlang/erts-5.10.4/man")
  (add-hook 'erlang-mode-hook
	    (lambda ()
	      (setq mode-name "Erlang")
	      ;; when starting an Erlang shell in Emacs, with a custom node name
	      (setq inferior-erlang-machine-options '("-sname" "hyloong"))
	      ))
  (setq erlang-compile-extra-opts '(debug_info (i . \"../../code/erl/include\")))
  )


;; (defun erlang/post-init-company ()
;;   (add-hook 'erl/erl_work/dev/emacsconf/ang-mode-hook 'company-mode))

;; (defun erlang/init-erlang ()
;;   (use-package erlang
;;     :defer t
;;     :init
;;     ;; progn 每一个表达式都执行，返回最后的返回值
;;     (progn
;;       ;; explicitly run prog-mode hooks since erlang mode does is not
;;       ;; derived from prog-mode major-mode
;;       (add-hook 'erlang-mode-hook (lambda () (run-hooks 'prog-mode-hook)))
;;       (setq erlang-root-dir "D:/erl_work/dev/erl5.10.4/erts-5.10.4")
;;       (add-to-list 'exec-path "D:/erl_work/dev/erl5.10.4/erts-5.10.4/bin")
;;       (setq erlang-man-root-dir "D:/erl_work/dev/erl5.10.4/erts-5.10.4/man")
;;       (add-hook 'erlang-mode-hook
;;                 (lambda ()
;;                   (setq mode-name "Erlang")
;;                   ;; when starting an Erlang shell in Emacs, with a custom node name
;;                   (setq inferior-erlang-machine-options '("-sname" "hyloong"))
;;                   ))
;;       (setq erlang-compile-extra-opts '(debug_info (i . \"../../code/erl/include\")))
;;       )
;;     :config
;;     (require 'erlang-start)))

;; (defun erlang/post-init-flycheck ()
;;   (spacemacs/add-flycheck-hook 'erlang-mode-hook))

(setq flycheck-erlang-include-path (list
                                    "inc"
                                    "../inc"
                                    "../../inc"
                                    "../../../inc"
                                    "include"
                                    "../include"
                                    "../../include"
                                    "../../../include"
                                    ))
(setq flycheck-erlang-library-path (list
                                    "../ebin"
                                    "../../ebin"
                                    "../../../ebin"
                                    ))

(provide 'init-erlang)
