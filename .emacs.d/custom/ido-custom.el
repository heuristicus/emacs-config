(require 'ido)

(setq ido-flex-matching t)
(setq ido-everywhere t)
(setq ido-file-extensions-order '(".py" ".c" ".tex" ".org" ".txt" ".el"))
(ido-mode 1)

(provide 'ido-custom)