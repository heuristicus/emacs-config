;; Turn off mouse interface at the start
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Add the directory containing .el files to the load path
(setq dotfiles-dir (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/custom"))
(let ((default-directory "~/.emacs.d/site-lisp/"))
      (normal-top-level-add-to-load-path '("color-theme-6.6.0/"
					   "auctex"
					   "auctex/preview"
					   "anthy" 
					   "auto-complete"
					   "yasnippet"
					   "rainbow-delimiters"
					   "autopair"
					   "word-count"
					   "smart-compile"
					   "cedet"
					   "markdown"
					   "popup")))

;; Load customised stuff
(require 'ido-custom)
(require 'color-theme-custom)
(require 'latex-custom)
(require 'keybind-custom)
(require 'jp-input-custom)
(require 'extras-custom) ; transparency
(require 'programming-custom)

;; org mode stuff
(setq org-completion-use-ido 1)
(setq org-empty-line-terminates-plain-lists 1)
(setq org-export-latex-hyperref-format "\\ref{%s}")

;; abbrevs
(setq abbrev-file-name "~/.emacs.d/custom/abbrevs")
(quietly-read-abbrev-file)
(dolist (abbr-hook '(org-mode-hook
		     text-mode-hook))
  (add-hook abbr-hook (lambda () (abbrev-mode 1))))

;; word-count
(require 'word-count)

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; autopair
(require 'autopair)
(dolist (ap-hook '(emacs-lisp-mode-hook
		   haskell-mode-hook 
		   python-mode-hook 
		   c-mode-common-hook 
		   java-mode-hook))
  (add-hook ap-hook 'autopair-mode))

;; cuda syntax highlighting
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs '( "~/.emacs.d/site-lisp/yasnippet/snippets" "~/.emacs.d/snippets"))
(yas/global-mode 1)

;; windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; pymacs
; (require 'pymacs)
; (pymacs-load "ropemacs" "rope-")

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

;; auto-complete mode
(require 'auto-complete-custom)
(dolist (ac-hook '(emacs-lisp-mode-hook 
		   haskell-mode-hook 
		   python-mode-hook 
		   c-mode-hook 
		   java-mode-hook 
		   latex-mode-hook))
  (add-hook ac-hook 'auto-complete-mode))


;; Rainbow delimiters
(require 'rainbow-delimiters)
(dolist (rainbow-hook '(emacs-lisp-mode-hook 
			haskell-mode-hook 
			python-mode-hook 
			c-mode-common-hook 
			java-mode-hook 
			latex-mode-hook ))
  (add-hook rainbow-hook 'rainbow-delimiters-mode))


;; Spell checking
(setq ispell-program-name "aspell"
      ispell-dictionary "british"
      ispell-extra-args '("--sug-mode=ultra"))
(add-hook 'org-mode-hook (lambda()(flyspell-mode 1)))
(add-hook 'latex-mode-hook (lambda()(flyspell-mode 1)))
(add-hook 'text-mode-hook (lambda()(flyspell-mode 1)))

;; Inhibit displaying stuff at startup
(setq inhibit-splash-screen t)

;; Replace yes-or-no prompt
(fset 'yes-or-no-p 'y-or-n-p)

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

;; set tooltips to display in the echo area
;(tooltip-mode -1)
;(setq tooltip-use-echo-area t)

;; load fonts last to stop them from being overridden
(require 'fonts-custom)

;; Set colour theme
(color-theme-zenburn)

;; cursor customisations
(blink-cursor-mode 0)

;; Fill columns to 80 characters
(setq-default fill-column 80)

;; Set column number mode
(setq column-number-mode t)

;; paren mode
(require 'paren)
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Auto fill for text modes
;(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Prevent pausing on C-z
(global-unset-key (kbd "C-z"))

;; Set some name and email variables
(setq user-mail-address "mxs968@cs.bham.ac.uk")
(setq user-full-name "Michal Staniaszek")
(setq add-log-full-name "Michal Staniaszek")
(setq add-log-mailing-address "mxs968@cs.bham.ac.uk")

;; Start emacs server
(server-start)
