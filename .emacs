;; Allows changing of transparency of emacs from within.
(defun djcb-opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
          (oldalpha (if alpha-or-nil alpha-or-nil 100))
          (newalpha (if dec (- oldalpha 10) (+ oldalpha 10))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

;;do not use scrollbars
;;(scroll-bar-mode -1)

 ;; C-8 will increase opacity (== decrease transparency)
 ;; C-9 will decrease opacity (== increase transparency
 ;; C-0 will returns the state to normal
(global-set-key (kbd "C-8") '(lambda()(interactive)(djcb-opacity-modify)))
(global-set-key (kbd "C-9") '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))
;; Starts the emacs server
(server-start)

;; visual line mode on by default
(visual-line-mode)

;; load mpc mode
(load "~/.emacs.d/mpc/mpc.el")

;; load git stuff
(load "/usr/share/doc/git-core/contrib/emacs/git.el")
(load "/usr/share/doc/git-core/contrib/emacs/git-blame.el")
(load "/usr/share/doc/git-core/contrib/emacs/vc-git.el")
(add-to-list 'vc-handled-backends 'GIT)

;; git-emacs
;(add-to-list 'load-path "~/.emacs.d/git-emacs-1.0")

;; Load git-emacs
;(add-to-list 'load-path "~/.emacs.d/git-emacs")
;(require 'git-emacs)

;; Initialises word count mode for use.
(setq load-path (cons (expand-file-name "~/elisp") load-path))
 (autoload 'word-count-mode "word-count"
           "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)

;; Sets up ido variables and activates ido-mode
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-file-extensions-order '(".tex" ".org"))
(ido-mode 1)

;; Loads auctex and latex preview
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

 ;;set xetex mode in tex/latex
(add-hook 'LaTeX-mode-hook (lambda()
(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
(setq TeX-command-default "LaTeX")
(setq TeX-save-query nil)
))

;; Loads YASnippets 0.6.1c
(add-to-list 'load-path
                  "~/.emacs.d/plugins/yasnippet-0.6.1c")
    (require 'yasnippet) ;; not yasnippet-bundle
    (yas/initialize)
    (yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets") 


;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
(load-file "~/.emacs.d/cedet-1.0/common/cedet.el")
;;(global-ede-mode 1)                    ; Enable the Project management system
(semantic-load-enable-gaudy-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu

;; Stops the emacs startup messages - goes straight to scratch
(setq inhibit-startup-message t
  inhibit-startup-echo-area-message t)

;; Set up custom key commands
(global-set-key (kbd "<f2> k") 'japanese-katakana-region)
(global-set-key (kbd "<f2> r") 'replace-string)

;; Set location of backups
(add-to-list 'backup-directory-alist
                  (cons "." "~/Dropbox/emacs_backups/"))
     (setq tramp-backup-directory-alist backup-directory-alist)

;; wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;;slime
(add-to-list 'load-path "~/.emacs.d/slime-2011-08-17/")  ; your SLIME directory
(setq inferior-lisp-program "clisp") ; your Lisp system
(require 'slime)
(slime-setup)

;; IMAP
(setq elmo-imap4-default-server "imap.gmail.com")
(setq elmo-imap4-default-user "m.staniaszek@gmail.com") 
(setq elmo-imap4-default-authenticate-type 'clear) 
(setq elmo-imap4-default-port '993)
(setq elmo-imap4-default-stream-type 'ssl)

(setq elmo-imap4-use-modified-utf7 t) 

;; SMTP
(setq wl-smtp-connection-type 'starttls)
(setq wl-smtp-posting-port 587)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "m.staniaszek")
(setq wl-smtp-posting-server "smtp.gmail.com")
(setq wl-local-domain "gmail.com")

(setq wl-default-folder "%inbox")
(setq wl-default-spec "%")
(setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
(setq wl-trash-folder "%[Gmail]/Trash")

(setq wl-folder-check-async t) 

(setq elmo-imap4-use-modified-utf7 t)

(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))


; Set load path for anthy.el
(push "/usr/share/emacs/site-lisp/anthy/" load-path)
; Load anthy.el
(load-library "leim-list")
(load-library "anthy")
;; Workarounds and customizations
; Fix slow input response in emacs23
(if (>= emacs-major-version 23)
(setq anthy-accept-timeout 1))
; Set japanese-anthy as the default input-method
(setq default-input-method "japanese-anthy")
; Shift-space to toggle anthy-mode (default is Ctrl-\)
(global-set-key (kbd "S-SPC") 'anthy-mode)
; Map wide-space to hankaku-space
(setq anthy-wide-space " ")


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-bar-LaTeX-buttons (quote (open-file save-buffer cut copy paste undo [separator nil] latex next-error view nil)))
 '(TeX-command-list (quote (("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Dropbox/Work/Organisation/assignments/assignments.org")))
 '(org-agenda-include-diary t)
 '(org-export-latex-tables-centered t)
 '(show-paren-mode t)
 '(tool-bar-mode t)
 '(tool-bar-style (quote text)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "white" :family "Inconsolata")))))


(put 'downcase-region 'disabled nil)
