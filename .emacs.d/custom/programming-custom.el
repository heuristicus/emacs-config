;; c mode
(require 'smart-compile)
(defun my-c-hook ()
  (setq c-default-style "linux")
  (c-toggle-auto-newline 1)
  (setq c-basic-offset 4))

(add-to-list 'smart-compile-alist '("\\.c$" . "gcc -Wall -o %n %f"))

(add-hook 'c-mode-hook 'my-c-hook)

(provide 'programming-custom)