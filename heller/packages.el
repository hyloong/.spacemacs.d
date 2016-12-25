;;; packages.el --- heller layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: root <root@localhost.heller>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `heller-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `heller/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `heller/pre-init-PACKAGE' and/or
;;   `heller/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

;; pre-init-xxx -> init -> post-init 执行顺序
;; 想要安装一个包，先检查是否已经安装了，如果安装了用post-init来设置自己想要的设置。

(defconst heller-packages
  '(youdao-dictionary
    ;; company
    ;; erlang
    ;; ggtags
    ;; helm-gtags
    ;; flycheck
    ;; (xxx :location (recipe :fetcher github :repo "xxxx")) ;; 测试安装
    )
  )

;; (defun heller/init-xxx()
;;   (use-package xxx
;;     init:
;;   )

;; youdao
(defun heller/init-youdao-dictionary()
  ;; M-Enter d m 进入打开宏看内部代码
  (use-package youdao-dictionary
    :defer t
    :init (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
    :init (spacemacs/set-leader-keys "oi" 'youdao-dictionary-search-from-input)
    )
  )

;; company
(defun heller/post-init-company()
  (setq company-minimum-prefix-length 1)
  (add-hook 'erlang-mode-hook 'company-mode)
  )

(defun erlang/init-erlang ()
  (use-package erlang
    :defer t
    :init
    (progn
      ;; explicitly run prog-mode hooks since erlang mode does is not
      ;; derived from prog-mode major-mode
      (add-hook 'erlang-mode-hook 'spacemacs/run-prog-mode-hooks)
      (if (string= system-type "darwin")
          (progn
            (setq erlang-root-dir "/usr/local/lib/erlang/erts-5.10.4")
            (add-to-list 'exec-path "/usr/local/lib/erlang/erts-5.10.4/bin")
            (setq erlang-man-root-dir "/usr/local/lib/erlang/erts-5.10.4/man")
            )
        (setq erlang-root-dir "/usr/local/Cellar/erlang-r19/19.0.2/lib/erlang/erts-8.0.2")
        (add-to-list 'exec-path "/usr/local/Cellar/erlang-r19/19.0.2/lib/erlang/erts-8.0.2/bin")
        (setq erlang-man-root-dir "/usr/local/Cellar/erlang-r19/19.0.2/lib/erlang/erts-8.0.2/man")
        )
      ;; (setq erlang-root-dir "/usr/local/lib/erlang/erts-5.10.4")
      ;; (add-to-list 'exec-path "/usr/local/lib/erlang/erts-5.10.4/bin")
      ;; (setq erlang-man-root-dir "/usr/local/lib/erlang/erts-5.10.4/man")
      (add-hook 'erlang-mode-hook
                (lambda ()
                  (setq mode-name "Erlang")
                  (setq inferior-erlang-machine-options '("-name" "heller@192.168.5.29" "-setcookie" "gs"))
                  ))
      (setq erlang-compile-extra-opts '(debug_info
                                        (i . \"../../../include\") (i . \"../../include\") (i . \"../include\"))))
    :config
    (require 'erlang-start))
  )

;; flycheck
(defun erlang/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'erlang-mode)
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
  )

;; gtags
(defun erlang/post-init-ggtags ()
  (add-hook 'erlang-mode-local-vars-hook #'spacemacs/ggtags-mode-enable))

;; helm gtags
(defun erlang/post-init-helm-gtags ()
  (spacemacs/helm-gtags-define-keys-for-mode 'erlang-mode))


;;; packages.el ends here
