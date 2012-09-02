(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-PDF-mode t)

 ;;set xetex mode in tex/latex
(add-hook 'LaTeX-mode-hook (lambda() 
(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
(add-to-list 'TeX-command-list '("pLaTeX" "%`platex%(mode)%' %t" TeX-run-TeX nil t))))


(provide 'latex-custom)