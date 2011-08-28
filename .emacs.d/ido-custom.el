(require 'ido)

(setq ido-flex-matching t)
(setq ido-everywhere t)
(setq ido-file-extensions-order '(".py" ".tex" ".org" ".txt"))
(ido-mode 1)

(provide 'ido-custom)