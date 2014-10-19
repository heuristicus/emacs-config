(require 'ido)

(setq ido-save-directory-list-file "~/.emacs.d/.ido.last"
      ido-file-extensions-order '(".py" ".c" ".tex" ".org" ".txt" ".el")
      ido-enable-flex-matching t
      ido-case-fold t
      ido-max-prospects 8
      ido-everywhere t
      ido-enable-last-directory-history t
      ido-max-work-directory-list 50
      ido-max-work-file-list 50
      ido-create-new-buffer 'always
      ido-auto-merge-work-directories-length -1)
(ido-mode 1)

(require 'ido-better-flex)
(ido-better-flex/enable)

(provide 'ido-custom)
