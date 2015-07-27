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
  (setq c-auto-newline -1)
  (setq c-toggle-auto-newline -1)
  (setq c-basic-offset 4)
  (setq c-toggle-auto-hungry-state 1))

;; quick switching between header and cpp
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(add-to-list 'smart-compile-alist '("\\.c$" . "gcc -g -Wall -Werror -o %n %f"))

(add-hook 'c-mode-common-hook 'my-c-hook)

;; (require 'helm-gtags)
;; ;; helm gtags
;; (setq
;;  helm-gtags-ignore-case t
;;  helm-gtags-auto-update t
;;  helm-gtags-use-input-at-cursor t
;;  helm-gtags-pulse-at-cursor t
;;  helm-gtags-prefix-key "\C-c"
;;  helm-gtags-suggested-key-mapping t
;;  )

;; enable subword mode for programming buffers
(dolist (sw-hook '(emacs-lisp-mode-hook
		   haskell-mode-hook
		   python-mode-hook
		   c-mode-hook
		   c++-mode-hook
		   lisp-mode-hook
		   java-mode-hook
		   latex-mode-hook))
  (add-hook sw-hook 'subword-mode))

(global-set-key (kbd "C-c i") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-c m") 'helm-man-woman)

;; Enable helm-gtags-mode
;; (add-hook 'dired-mode-hook 'helm-gtags-mode)
;; (add-hook 'eshell-mode-hook 'helm-gtags-mode)
;; (add-hook 'c-mode-hook 'helm-gtags-mode)
;; (add-hook 'c++-mode-hook 'helm-gtags-mode)
;; (add-hook 'asm-mode-hook 'helm-gtags-mode)

;; (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;; (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
;; (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;; (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;; (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;; (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;; cuda syntax highlighting
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;; cedet
(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

;;Hide compilation window on success
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

;; Doxygen 
(add-hook 'c-mode-common-hook
  (lambda ()
    (require 'doxymacs)
    (doxymacs-mode t)
    (doxymacs-font-lock)))

;; put emacs into octave-mode when a matlab file is read.
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; use projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-enable-caching t)


(provide 'programming-custom)
