(let ((default-directory (concat dotfiles-dir "/themes")))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; should do this in a nicer way to allow all subdirectories to be loaded.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-theme 'zenburn t)

(provide 'color-theme-custom)
