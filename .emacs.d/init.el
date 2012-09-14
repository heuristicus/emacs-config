;; Turn off mouse interface at the start
;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
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
					   "cedet")))

;; Load customised stuff

(require 'ido-custom)
(require 'color-theme-custom)
(require 'latex-custom)
(require 'keybind-custom)
(require 'jp-input-custom)
(require 'fonts-custom)
(require 'extras-custom) ; transparency
(require 'programming-custom)

;; abbrevs
(setq abbrev-file-name "~/.emacs.d/custom/abbrevs")
(quietly-read-abbrev-file)
(dolist (abbr-hook '(org-mode-hook
		     text-mode-hook))
  (add-hook abbr-hook (lambda () (abbrev-mode 1))))

;; word-count
(require 'word-count)

;; autopair
(require 'autopair)
(dolist (ap-hook '(emacs-lisp-mode-hook
		   haskell-mode-hook 
		   python-mode-hook 
		   c-mode-hook 
		   java-mode-hook))
  (add-hook ap-hook 'autopair-mode))


;; yasnippet
(require 'yasnippet)
(yas/initialize)
(setq yas-snippet-dirs '( "~/.emacs.d/site-lisp/yasnippet/snippets" "~/.emacs.d/snippets"))
(yas/global-mode 1)


;; pymacs
; (require 'pymacs)
; (pymacs-load "ropemacs" "rope-")

;; cedet
;(load-file (concat dotfiles-dir "/site-lisp/cedet/cedet-1.1/common/cedet.el"))
;(require 'semantic-gcc)
;(semantic-load-enable-code-helpers)

;; auto-complete mode
(require 'auto-complete-custom)

;; Rainbow delimiters
(require 'rainbow-delimiters)
(dolist (rainbow-hook '(emacs-lisp-mode-hook 
			haskell-mode-hook 
			python-mode-hook 
			c-mode-hook 
			java-mode-hook 
			latex-mode-hook ))
  (add-hook rainbow-hook 'rainbow-delimiters-mode))


;; Spell checking
(setq ispell-program-name "aspell"
  ispell-extra-args '("--sug-mode=ultra"))
(add-hook 'org-mode-hook (lambda()(flyspell-mode 1)))
(add-hook 'latex-mode-hook (lambda()(flyspell-mode 1)))
(add-hook 'text-mode-hook (lambda()(flyspell-mode 1)))

;; Inhibit displaying stuff at startup
(setq inhibit-splash-screen t)

;; Set colour theme
(color-theme-zenburn)

;; cursor customisations
(blink-cursor-mode 0)

;; AUCTeX evince viewer
(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "evince %o"))))

;; Start emacs server
(server-start)