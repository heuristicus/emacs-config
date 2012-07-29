;; Echo area input
;; Incompatible with autopair-mode
(require 'mozc)

(setq default-input-method "japanese-mozc")
(global-set-key (kbd "S-SPC") 'toggle-input-method)
(setq mozc-candidate-style 'echo-area)

;; Overlay input
;; ;; ibus-mode
;; (require 'ibus)
;; ;; Turn on ibus-mode automatically after loading .emacs
;; (add-hook 'after-init-hook 'ibus-mode-on)
;; ;; Use C-SPC for Set Mark command
;; (ibus-define-common-key ?\C-\s nil)
;; ;; Use C-/ for Undo command
;; (ibus-define-common-key ?\C-/ nil)
;; ;; Change cursor color depending on IBus status
;; (global-set-key (kbd "C-o") 'ibus-toggle)

(provide 'jp-input-custom)