(require 'helm-config)
(require 'helm-ag)

(global-set-key (kbd "C-c h") 'helm-command-prefix)

(eval-after-load 'helm '(progn (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)))

(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t 
      helm-buffer-max-length 35               ; max length of the buffer name in helm-mini
      helm-M-x-fuzzy-match t                  ; use fuzzy matching with M-x
      helm-buffers-fuzzy-matching t           ; fuzzy matching for buffer selection
      helm-recentf-fuzzy-match    t
      )

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c s") 'helm-ag-this-file)
(global-set-key (kbd "C-;") 'helm-mini)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(eval-after-load "helm-files"
  '(let ((helm-find-files-C-h-map (lookup-key helm-find-files-map (kbd "C-h"))))
     (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)))



(provide 'helm-custom)
