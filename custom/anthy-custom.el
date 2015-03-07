(require 'anthy)

;; Set japanese as default anthy input
(setq default-input-method "japanese-anthy")

;; Fix slowdown issue
(if (>= emacs-major-version 23)
    (setq anthy-accept-timeout 1))

;; Set global key
(global-set-key (kbd "S-SPC") 'anthy-mode)

(provide 'anthy-custom)