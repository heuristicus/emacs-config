;; Turn off mouse interface at the start
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Add the directory containing .el files to the load path
(setq dotfiles-dir (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/color-theme-6.6.0/"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/auctex"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/auctex/preview"))

;; Load customised stuff
(require 'ido-custom)
(require 'color-theme-custom)
(require 'latex-custom)
(require 'keybind-custom)
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)


;; Inhibit displaying stuff at startup
(setq inhibit-splash-screen t)

;; Set default font for everything.
(if (eq window-system 'x)
    (set-default-font "Inconsolata-10"))

;; Set colour theme and start the emacs server
(color-theme-zenburn)