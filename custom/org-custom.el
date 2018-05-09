(setq org-agenda-include-diary t)
(setq org-agenda-files (quote ("~/Dropbox/work/bham/notes.org" "/home/michal/Dropbox/work/notes.org")))
(setq org-log-done 'time)
(setq org-todo-keywords
       '((sequence "TODO(t!)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(setq org-completion-use-ido 1)
(setq org-empty-line-terminates-plain-lists 1)
(setq org-export-latex-hyperref-format "\\ref{%s}")
;(require 'org-special-blocks)
;(defalias 'org-called-interactively-p 'called-interactively-p)
(global-set-key "\C-ca" 'org-agenda)

(provide 'org-custom)
