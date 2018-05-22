;;-*-coding: utf-8;-*-
(define-abbrev-table 'Buffer-menu-mode-abbrev-table '())

(define-abbrev-table 'Custom-mode-abbrev-table '())

(define-abbrev-table 'Info-edit-mode-abbrev-table '())

(define-abbrev-table 'awk-mode-abbrev-table
'(
))

(define-abbrev-table 'bookmark-bmenu-mode-abbrev-table '())

(define-abbrev-table 'bookmark-edit-annotation-mode-abbrev-table '())

(define-abbrev-table 'c++-mode-abbrev-table
'(
))

(define-abbrev-table 'c-mode-abbrev-table
'(
))

(define-abbrev-table 'calendar-mode-abbrev-table '())

(define-abbrev-table 'comint-mode-abbrev-table '())

(define-abbrev-table 'completion-list-mode-abbrev-table '())

(define-abbrev-table 'csharp-mode-abbrev-table
'(
("xyt" "############### xyt ###############" nil 0)
))

(define-abbrev-table 'data-debug-mode-abbrev-table '())

(define-abbrev-table 'diff-mode-abbrev-table '())

(define-abbrev-table 'edebug-eval-mode-abbrev-table '())

(define-abbrev-table 'edit-abbrevs-mode-abbrev-table '())

(define-abbrev-table 'eieio-custom-mode-abbrev-table '())

(define-abbrev-table 'elisp-byte-code-mode-abbrev-table '())

(define-abbrev-table 'emacs-lisp-mode-abbrev-table '())

(define-abbrev-table 'erlang-mode-abbrev-table
'(
("?li" "?LINE" nil 0)
("?md" "?MODULE" nil 0)
("fgxp" "%% ================================= private fun =================================" nil 0)
("gscc" "gen_server:call(misc:get_globle_pid(?MODULE), {Msg, Args})." nil 0)
("gscs" "gen_server:cast(misc:get_globle_pid(?MODULE), {Msg, Args})." nil 0)
("imf" "io:format(\"~p ~p Args:~p~n\", [?MODULE, ?LINE, []])," nil 2)
("emf" "?ERR(\"Args:~p~n\", [[]])," nil 0)

("dohcall" "handle_call(Req, From, State) ->
                case catch do_handle_call(Req, From, State) of
                     {reply, Res, State};
                          {reply, Res, State};
                    Res ->
                         ?ERR(\"Req Error:~p~n\", [[Msg, Res]]),
                         {reply, ok, State};
                end.
            do_handle_call(_Req, _From, State) ->
                 {reply, ok, State}." nil 0)

("dohcast" "handle_cast(Msg, State) ->
                case catch do_handle_cast(Msg, State) of
                    {noreply, NewState} ->
                         {noreply, NewState};
                    Res ->
                         ?ERR(\"Msg Error:~p~n\", [[Msg, Res]]),
                         {noreply, State};
                end.
            do_handle_cast(_Msg, State) ->
                 {noreply, State}." nil 0)

("dohinfo" "handle_info(Info, State) ->
                case catch do_handle_info(Info, State) of
                     {noreply, NewState} ->
                          {noreply, NewState};
                    Res ->
                          ?ERR(\"Info Error:~p~n\", [[Info, Res]]),
                          {noreply, State}
                end.
            do_handle_info(_Info, State) ->
                 {noreply, State}." nil 0)
))

(define-abbrev-table 'evil-command-window-mode-abbrev-table '())

(define-abbrev-table 'evil-list-view-mode-abbrev-table '())

(define-abbrev-table 'flycheck-error-list-mode-abbrev-table '())

(define-abbrev-table 'fundamental-mode-abbrev-table '())

(define-abbrev-table 'ggtags-global-mode-abbrev-table '())

(define-abbrev-table 'ggtags-view-search-history-mode-abbrev-table '())

(define-abbrev-table 'global-abbrev-table
'(
("xyt" "xyt ###############" nil 2)
))

(define-abbrev-table 'grep-mode-abbrev-table '())

(define-abbrev-table 'helm-grep-mode-abbrev-table '())

(define-abbrev-table 'helm-major-mode-abbrev-table '())

(define-abbrev-table 'helm-moccur-mode-abbrev-table '())

(define-abbrev-table 'help-mode-abbrev-table '())

(define-abbrev-table 'ibuffer-mode-abbrev-table '())

(define-abbrev-table 'idl-mode-abbrev-table '())

(define-abbrev-table 'image-dired-display-image-mode-abbrev-table '())

(define-abbrev-table 'image-dired-thumbnail-mode-abbrev-table '())

(define-abbrev-table 'java-mode-abbrev-table
'(
))

(define-abbrev-table 'lisp-mode-abbrev-table '())

(define-abbrev-table 'messages-buffer-mode-abbrev-table '())

(define-abbrev-table 'objc-mode-abbrev-table
'(
))

(define-abbrev-table 'occur-edit-mode-abbrev-table '())

(define-abbrev-table 'occur-mode-abbrev-table '())

(define-abbrev-table 'org-mode-abbrev-table '())

(define-abbrev-table 'outline-mode-abbrev-table '())

(define-abbrev-table 'package-menu-mode-abbrev-table '())

(define-abbrev-table 'pike-mode-abbrev-table
'(
))

(define-abbrev-table 'process-menu-mode-abbrev-table '())

(define-abbrev-table 'profiler-report-mode-abbrev-table '())

(define-abbrev-table 'prog-mode-abbrev-table '())

(define-abbrev-table 'select-tags-table-mode-abbrev-table '())

(define-abbrev-table 'shell-mode-abbrev-table '())

(define-abbrev-table 'snippet-mode-abbrev-table '())

(define-abbrev-table 'spacemacs/report-issue-mode-abbrev-table '())

(define-abbrev-table 'special-mode-abbrev-table '())

(define-abbrev-table 'speedbar-mode-abbrev-table '())

(define-abbrev-table 'tabulated-list-mode-abbrev-table '())

(define-abbrev-table 'text-mode-abbrev-table '())

(define-abbrev-table 'url-cookie-mode-abbrev-table '())

(define-abbrev-table 'vc-git-log-edit-mode-abbrev-table '())

(define-abbrev-table 'vc-git-log-view-mode-abbrev-table '())

(define-abbrev-table 'vc-git-region-history-mode-abbrev-table '())

(define-abbrev-table 'vc-svn-log-view-mode-abbrev-table '())

(define-abbrev-table 'xref--xref-buffer-mode-abbrev-table '())

