;; Turn off mouse interface at the start
;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Add the directory containing .el files to the load path
(setq dotfiles-dir (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/color-theme-6.6.0/"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/auctex"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/auctex/preview"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/anthy")) 
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/auto-complete"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/yasnippet"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/rainbow-delimiters"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/autocomplete"))

;; Load customised stuff
(require 'ido-custom)
(require 'color-theme-custom)
(require 'latex-custom)
(require 'keybind-custom)
(require 'anthy-custom)
(require 'fonts-custom)
(require 'extras-custom) ; transparency

;; autopair
(require 'autopair)
(add-hook 'emacs-lisp-mode-hook 'autopair-mode)
(add-hook 'haskell-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'c-mode-hook 'autopair-mode)
(add-hook 'java-mode-hook 'autopair-mode)
; (add-hook 'TeX-mode-hook 'autopair-mode)

;; yasnippet
(require 'yasnippet)
(yas/initialize)
(setq yas/snippet-dirs (concat dotfiles-dir "/site-lisp/yasnippet/snippets"))
(yas/global-mode 1)


;; pymacs
; (require 'pymacs)
; (pymacs-load "ropemacs" "rope-")

;; auto-complete mode
(require 'auto-complete)
(add-hook 'emacs-lisp-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'haskell-mode-hook 'auto-complete-mode)
(add-hook 'c-mode-hook 'auto-complete-mode)

;; Rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'haskell-mode-hook 'rainbow-delimiters-mode)
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
(add-hook 'c-mode-hook 'rainbow-delimiters-mode)
(add-hook 'java-mode-hook 'rainbow-delimiters-mode)

;; Spell checking
(setq ispell-program-name "aspell"
  ispell-extra-args '("--sug-mode=ultra"))
(add-hook 'org-mode-hook (lambda()(flyspell-mode 1)))
(add-hook 'latex-mode-hook (lambda()(flyspell-mode 1)))
(add-hook 'text-mode-hook (lambda()(flyspell-mode 1)))

;; Inhibit displaying stuff at startup
(setq inhibit-splash-screen t)

;; Set default font for everything.
(if (eq window-system 'x)
    (set-default-font "Inconsolata-10"))

;; Set colour theme
(color-theme-zenburn)

;; cursor customisations
(blink-cursor-mode nil)

;; AUCTeX evince viewer
(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "evince %o"))))

;; Start emacs server
(server-start)