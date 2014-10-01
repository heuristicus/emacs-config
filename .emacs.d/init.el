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
					   "smart-compile"
					   "cedet"
					   "popup"
					   "pandoc"
					   "org"
					   "slime"
					   "markdown"
					   ;;"mozc"
						)))

;; Load customised stuff
(require 'ido-custom)
(require 'color-theme-custom)
(require 'latex-custom)
(require 'keybind-custom)
;(require 'jp-input-custom)
(require 'extras-custom) ; transparency
(require 'programming-custom)

;; org mode stuff
(setq org-completion-use-ido 1)
(setq org-empty-line-terminates-plain-lists 1)
(setq org-export-latex-hyperref-format "\\ref{%s}")
;(require 'org-special-blocks)
(defalias 'org-called-interactively-p 'called-interactively-p)

;; abbrevs
(setq abbrev-file-name "~/.emacs.d/custom/abbrevs")
(quietly-read-abbrev-file)
(dolist (abbr-hook '(org-mode-hook
		     text-mode-hook))
  (add-hook abbr-hook (lambda () (abbrev-mode 1))))

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs '( "~/.emacs.d/site-lisp/yasnippet/snippets" "~/.emacs.d/snippets"))
(yas/global-mode 1)

;; windmove for fast switching between open buffer (shift-arrow)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; auto-complete mode
(require 'auto-complete-custom)
(dolist (ac-hook '(emacs-lisp-mode-hook 
		   haskell-mode-hook 
		   python-mode-hook 
		   c-mode-hook
		   c++-mode-hook
		   lisp-mode-hook
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
			latex-mode-hook
			lisp-mode-hook))
  (add-hook rainbow-hook 'rainbow-delimiters-mode))


;; Auto fill for text modes
(dolist (auto-fill-hook '(text-mode-hook
			  latex-mode-hook))
  (add-hook auto-fill-hook 'turn-on-auto-fill))


;; Spell checking
(setq ispell-program-name "aspell"
      ispell-dictionary "british"
      ispell-extra-args '("--sug-mode=ultra"))
(dolist (spell-hook '(org-mode-hook
		      latex-mode-hook
		      text-mode-hook))
  (add-hook spell-hook (lambda () (flyspell-mode 1))))

;; Inhibit displaying stuff at startup
(setq inhibit-splash-screen t)

;; Replace yes-or-no prompt
(fset 'yes-or-no-p 'y-or-n-p)

;; use XML in ROS .launch files
(add-to-list 'auto-mode-alist '("\\.launch\\'" . xml-mode))

;; set tooltips to display in the echo area
;(tooltip-mode -1)
;(setq tooltip-use-echo-area t)

;; change sentence endings to single space for M-e and M-a
(setq sentence-end-double-space nil)

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


;; Prevent pausing on C-z
(global-unset-key (kbd "C-z"))

;; Set some name and email variables
(setq user-mail-address "michalst@kth.se")
(setq user-full-name "Michal Staniaszek")
(setq add-log-full-name "Michal Staniaszek")
(setq add-log-mailing-address "michalst@kth.se")

;; Start emacs server
(server-start)

;; set font sizes for different computers
(when (equal system-name "russell")
  (set-default-font "Inconsolata-10"))
(when (equal system-name "sagan")
  (set-default-font "Inconsolata-10"))
