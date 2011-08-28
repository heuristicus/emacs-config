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

(require 'ido-custom)
(require 'color-theme-custom)
(require 'latex-custom)

(color-theme-zenburn)
(server-start)