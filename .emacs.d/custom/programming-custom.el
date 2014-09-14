;; c mode
(require 'smart-compile)
(defun my-c-hook ()
  (setq c-default-style "k&r")
  (c-toggle-auto-newline 1)
  (setq c-basic-offset 4)
  (c-toggle-auto-hungry-state 1))

(add-to-list 'smart-compile-alist '("\\.c$" . "gcc -g -Wall -Werror -o %n %f"))

(add-hook 'c-mode-common-hook 'my-c-hook)

;; general programming setup


;; slime for CLISP
(setq inferior-lisp-program "/usr/bin/clisp")
(require 'slime)
(slime-setup '(slime-fancy
	       slime-indentation))

;; put emacs into octave-mode when a matlab file is read.
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

(provide 'programming-custom)
