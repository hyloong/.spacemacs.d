;; org 序号排序技巧 M － enter

(with-eval-after-load 'org
  ;; org 代码块显示高亮
  ;; #+BEGIN_SRC 中间显示高亮 
  (setq org-src-fontify-natively t)
  ;; #+END_SRC

  ;; 设置org管理的目录
  (setq org-agenda-files '("~/.emacs.d"))

  ;; 工作安排
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	   "* TODO [#B] %?\n %i\n"
	   :empty-lines 1)
	  ("c" "Chrome" entry (file+headline "~/.eamcs.d/gtd.org" "Quick notes")
	   "* TODO [#C] %?0\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
	   :empty-lines 1))
	)
  )

(defun zilongshanren/insert-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (insert (zilongshanren/retrieve-chrome-current-tab-url)))


;; 
(defun zilongshanren/retrieve-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (let ((result (do-applescript
                 (concat
                  "set frontmostApplication to path to frontmost application\n"
                  "tell application \"Google Chrome\"\n"
                  "	set theUrl to get URL of active tab of first window\n"
                  "	set theResult to (get theUrl) \n"
                  "end tell\n"
                  "activate application (frontmostApplication as text)\n"
                  "set links to {}\n"
                  "copy theResult to the end of links\n"
                  "return links as string\n"))))
    (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))

(provide 'init-org)
