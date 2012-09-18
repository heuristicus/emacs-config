(require 'ido)

(setq ido-save-directory-list-file ".emacs.d/.ido.last"
      ido-file-extensions-order '(".py" ".c" ".tex" ".org" ".txt" ".el")
      ido-enable-flex-matching t
      ido-case-fold t
      ido-max-prospects 8
      ido-everywhere t
      ido-enable-last-directory-history t
      ido-max-work-directory-list 30
      ido-max-work-file-list 50)
(ido-mode 1)

(provide 'ido-custom)