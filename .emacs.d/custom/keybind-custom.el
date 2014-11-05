(global-set-key (kbd "<f2> k") 'japanese-katakana-region)
(global-set-key (kbd "<f2> r") 'replace-string)
(global-set-key (kbd "<f2> R") 'query-replace)
(global-set-key (kbd "<f2> e") 'eval-buffer)
(global-set-key (kbd "C-c c") 'smart-compile)
(global-set-key (kbd "C-c - C-c") 'uncomment-region)
(global-set-key (kbd "C-c s") 'shell)
;; dirty fix for ctrl-replaced caps key setting marks with these commands
(global-set-key (kbd "C-S-n") 'next-line)
(global-set-key (kbd "C-S-p") 'previous-line)
(global-set-key (kbd "C-S-b") 'backward-char)
(global-set-key (kbd "C-S-f") 'forward-char)
(global-set-key (kbd "C-M-S-n") 'backward-list)
(global-set-key (kbd "C-M-S-p") 'forward-list)
(global-set-key (kbd "C-M-S-b") 'backward-sexp)
(global-set-key (kbd "C-M-S-f") 'forward-sexp)
(global-set-key (kbd "C-S-a") 'move-beginning-of-line)
(global-set-key (kbd "C-S-e") 'move-end-of-line)

(global-set-key (kbd "M-n") 'scroll-other-window)
(global-set-key (kbd "M-p") 'scroll-other-window-down)

;; (defvar fringes-set nil)

;; (defun centre-buffer ()
;;   (if fringes-set
;;       (set-fringe-mode '(1 . 1))
;;     (set-fringe-mode '(200 . 200)))
;;   (setq fringes-set (not fringes-set))
;;   (fringes-set))

;; (global-set-key (kbd "<f2> m") (centre-buffer))

(provide 'keybind-custom)
