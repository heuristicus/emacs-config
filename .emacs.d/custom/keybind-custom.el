(global-set-key (kbd "<f2> k") 'japanese-katakana-region)
(global-set-key (kbd "<f2> r") 'replace-string)
(global-set-key (kbd "<f2> R") 'query-replace)
(global-set-key (kbd "<f2> e") 'eval-buffer)
(global-set-key (kbd "C-c c") 'smart-compile)

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

(provide 'keybind-custom)