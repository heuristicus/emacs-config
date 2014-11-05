(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-PDF-mode t)


 ;;set xetex mode in tex/latex
(add-hook 'LaTeX-mode-hook (lambda()
(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))))

(setq TeX-view-program-list
      '(("evince" "evince %o")))
(setq TeX-view-program-selection '((output-pdf "Evince")))

;; AUCTeX evince viewer
(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "evince -f %o")
        ("^html?$" "." "chromium %o"))))

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(setq LaTeX-verbatim-environments-local '("BVerbatim"))

;; TeXcount setup for AUCTeX
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
	       '("TeXcount" "texcount %s.tex" TeX-run-compile nil t :help "Run texcount") t))

(provide 'latex-custom)
