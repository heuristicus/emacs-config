;; Turn off mouse interface at the start
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Minimal fringes
(set-fringe-mode 1)

;; Inhibit displaying stuff at startup
(setq inhibit-splash-screen t)

;; start maximised by default
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Add the directory containing .el files to the load path
(setq dotfiles-dir (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path dotfiles-dir)

;; list of packages that are in use (make sure to update if new ones are added!)
;; find this list using C-? v package-activated-list
(setq package-list '(helm-projectile projectile auctex
		     auto-complete autopair color-theme company helm-gtags helm async
		     markdown-mode mozc pandoc-mode popup rainbow-blocks
		     rainbow-delimiters rainbow-identifiers slime smart-compile
		     yaml-mode yasnippet zenburn-theme jinja2-mode))

;; package archives other than the default
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")))


;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages - should only happen when emacs is installed on
;; a new system
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Stuff downloaded from the package manager. Load all subdirs
(let ((default-directory (concat dotfiles-dir "/elpa")))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path (concat dotfiles-dir "/custom"))

;; Load customised stuff
(require 'ido-custom)
(require 'color-theme-custom)
(require 'latex-custom)

(require 'helm-custom)
;(require 'jp-input-custom)
(require 'extras-custom) ; transparency
(require 'programming-custom)

;; Move on visual lines as opposed to actual lines
(setq line-move-visual t)

;; Automatically revert a file once changed
(global-auto-revert-mode 1)

;; org mode stuff
(setq org-completion-use-ido 1)
(setq org-empty-line-terminates-plain-lists 1)
(setq org-export-latex-hyperref-format "\\ref{%s}")
;(require 'org-special-blocks)
;(defalias 'org-called-interactively-p 'called-interactively-p)

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

;; yaml mode
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" "\\.yaml$" . yaml-mode))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "<ret>" 'newline-and-indent)))

;; yasnippet
(require 'yasnippet)
; use ido as the default expansion selection
(setq yas-prompt-functions
      (cons 'yas-ido-prompt
	    (remove 'yas-ido-prompt
		    yas-prompt-functions)))
(yas/global-mode 1)

;; windmove for fast switching between open buffer (shift-arrow)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; auto-complete mode
;; (require 'auto-complete-custom)
;; (dolist (ac-hook '(emacs-lisp-mode-hook 
;; 		   haskell-mode-hook 
;; 		   python-mode-hook 
;; 		   c-mode-hook
;; 		   c++-mode-hook
;; 		   lisp-mode-hook
;; 		   java-mode-hook 
;; 		   latex-mode-hook))
;;   (add-hook ac-hook 'auto-complete-mode))

;; company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.4)
(global-set-key (kbd "C-.") 'company-complete)

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

;; save sessions
(desktop-save-mode 1)
;; save the desktop whenever a new file is opened
(add-hook 'find-file-hook (lambda () (desktop-save "~/.emacs.d")))

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

;; load some keybinding stuff last so that it is not overwritten
(require 'keybind-custom)
(global-set-key (kbd "<return>") 'ignore)
(global-set-key (kbd "<backspace>") 'ignore)
