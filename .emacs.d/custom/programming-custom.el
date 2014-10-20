;; autopair
(require 'autopair)
(dolist (ap-hook '(emacs-lisp-mode-hook
		   haskell-mode-hook 
		   python-mode-hook 
		   c-mode-common-hook 
		   java-mode-hook))
  (add-hook ap-hook 'autopair-mode))

;; c mode
(require 'smart-compile)
(defun my-c-hook ()
  (setq c-default-style "k&r")
  (c-toggle-auto-newline 1)
  (setq c-basic-offset 4)
  (c-toggle-auto-hungry-state 1))

(add-to-list 'smart-compile-alist '("\\.c$" . "gcc -g -Wall -Werror -o %n %f"))

(add-hook 'c-mode-common-hook 'my-c-hook)

(require 'helm-gtags)
;; helm gtags
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-c"
 helm-gtags-suggested-key-mapping t
 )

;; (global-set-key (kbd "C-c i") 'helm-semantic-or-imenu)
;; (global-set-key (kbd "C-c m") 'helm-man-woman)

;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;; cuda syntax highlighting
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;; cedet
;; (load-file (concat dotfiles-dir "/site-lisp/cedet/cedet-1.1/common/cedet.el"))
;; (require 'semantic-gcc)
;; (require 'semantic/ia)
;; (when (cedet-gnu-global-version-check t)
;;   (semanticdb-enable-gnu-global-databases 'c-mode)
;;   (semanticdb-enable-gnu-global-databases 'c++-mode))
;; (semantic-load-enable-code-helpers)
;; (global-ede-mode 1)
;; (defun my-cedet-hook ()
;;   (local-set-key (kbd "C-;") 'semantic-ia-complete-symbol-menu)
;;   (local-set-key (kbd "C-.") 'semantic-complete-analyze-inline)
;;   (local-set-key (kbd "C-c p") 'semantic-analyze-proto-impl-toggle))
;; (add-hook 'c-mode-common-hook 'my-cedet-hook)
;; (defun my-c-mode-cedet-hook ()
;;   (local-set-key (kbd ".") 'semantic-complete-self-insert)
;;   (local-set-key (kbd ">") 'semantic-complete-self-insert)
;;   (add-to-list 'ac-sources 'ac-source-gtags)
;;   (add-to-list 'ac-sources 'ac-source-semantic))
;; (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; Hide compilation window on success
(winner-mode 1)
(setq compilation-finish-functions 'compile-autoclose)
(defun compile-autoclose (buffer string)
  (cond ((string-match "finished" string)
	 (bury-buffer "*compilation*")
	 (winner-undo)
	 (message "Build successful."))
	(t                                                                    
	 (message "Compilation exited abnormally: %s" string))))

;; general programming setup


;; slime for CLISP
(setq inferior-lisp-program "/usr/bin/clisp")
(require 'slime)
(slime-setup '(slime-fancy
	       slime-indentation))

;; put emacs into octave-mode when a matlab file is read.
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

(provide 'programming-custom)
