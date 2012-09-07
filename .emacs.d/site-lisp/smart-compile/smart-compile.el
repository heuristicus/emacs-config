<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: smart-compile.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=smart-compile.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: smart-compile.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=smart-compile.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for smart-compile.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=smart-compile.el" /><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<br /><span class="specialdays">Brazil, Independence Day</span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22smart-compile.el%22">smart-compile.el</a></h1></div><div class="wrapper"><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/smart-compile.el">Download</a></p><pre class="code"><span class="linecomment">;;; smart-compile.el --- an interface to `compile'</span>

<span class="linecomment">;; Copyright (C) 1998-2012  by Seiji Zenitani</span>

<span class="linecomment">;; Author: Seiji Zenitani &lt;zenitani@mac.com&gt;</span>
<span class="linecomment">;; $Id: smart-compile.el 764 2012-07-10 15:58:08Z zenitani $</span>
<span class="linecomment">;; Keywords: tools, unix</span>
<span class="linecomment">;; Created: 1998-12-27</span>
<span class="linecomment">;; Compatibility: Emacs 21 or later</span>
<span class="linecomment">;; URL(en): http://www.emacswiki.org/emacs/smart-compile.el</span>
<span class="linecomment">;; URL(jp): http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html#smart-compile</span>

<span class="linecomment">;; Contributors: Sakito Hisakura, Greg Pfell</span>

<span class="linecomment">;; This file is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This file is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with GNU Emacs; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,</span>
<span class="linecomment">;; Boston, MA 02111-1307, USA.</span>

<span class="linecomment">;;; Commentary:</span>

<span class="linecomment">;; This package provides `smart-compile' function.</span>
<span class="linecomment">;; You can associates a particular file with a particular compile functions,</span>
<span class="linecomment">;; by editing `smart-compile-alist'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; To use this package, add these lines to your .emacs file:</span>
<span class="linecomment">;;     (require 'smart-compile)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Note that it requires emacs 21 or later.</span>

<span class="linecomment">;;; Code:</span>

(defgroup smart-compile nil
  "<span class="quote">An interface to `compile'.</span>"
  :group 'processes
  :prefix "<span class="quote">smart-compile</span>")

(defcustom smart-compile-alist '(
  (emacs-lisp-mode    . (emacs-lisp-byte-compile))
  (html-mode          . (browse-url-of-buffer))
  (nxhtml-mode        . (browse-url-of-buffer))
  (html-helper-mode   . (browse-url-of-buffer))
  (octave-mode        . (run-octave))
  ("<span class="quote">\\.c\\'</span>"          . "<span class="quote">gcc -O2 %f -lm -o %n</span>")
<span class="linecomment">;;  ("\\.c\\'"          . "gcc -O2 %f -lm -o %n && ./%n")</span>
  ("<span class="quote">\\.[Cc]+[Pp]*\\'</span>" . "<span class="quote">g++ -O2 %f -lm -o %n</span>")
  ("<span class="quote">\\.m\\'</span>"          . "<span class="quote">gcc -O2 %f -lobjc -lpthread -o %n</span>")
  ("<span class="quote">\\.java\\'</span>"       . "<span class="quote">javac %f</span>")
  ("<span class="quote">\\.php\\'</span>"        . "<span class="quote">php -l %f</span>")
  ("<span class="quote">\\.f90\\'</span>"        . "<span class="quote">gfortran %f -o %n</span>")
  ("<span class="quote">\\.[Ff]\\'</span>"       . "<span class="quote">gfortran %f -o %n</span>")
  ("<span class="quote">\\.cron\\(tab\\)?\\'</span>" . "<span class="quote">crontab %f</span>")
  ("<span class="quote">\\.tex\\'</span>"        . (tex-file))
  ("<span class="quote">\\.texi\\'</span>"       . "<span class="quote">makeinfo %f</span>")
  ("<span class="quote">\\.mp\\'</span>"         . "<span class="quote">mptopdf %f</span>")
  ("<span class="quote">\\.pl\\'</span>"         . "<span class="quote">perl -cw %f</span>")
  ("<span class="quote">\\.rb\\'</span>"         . "<span class="quote">ruby -cw %f</span>")
)  "<span class="quote">Alist of filename patterns vs corresponding format control strings.
Each element looks like (REGEXP . STRING) or (MAJOR-MODE . STRING).
Visiting a file whose name matches REGEXP specifies STRING as the
format control string.  Instead of REGEXP, MAJOR-MODE can also be used.
The compilation command will be generated from STRING.
The following %-sequences will be replaced by:

  %F  absolute pathname            ( /usr/local/bin/netscape.bin )
  %f  file name without directory  ( netscape.bin )
  %n  file name without extension  ( netscape )
  %e  extension of file name       ( bin )

  %o  value of `smart-compile-option-string'  ( \"user-defined\" ).

If the second item of the alist element is an emacs-lisp FUNCTION,
evaluate FUNCTION instead of running a compilation command.
</span>"
   :type '(repeat
           (cons
            (choice
             (regexp :tag "<span class="quote">Filename pattern</span>")
             (function :tag "<span class="quote">Major-mode</span>"))
            (choice
             (string :tag "<span class="quote">Compilation command</span>")
             (sexp :tag "<span class="quote">Lisp expression</span>"))))
   :group 'smart-compile)
(put 'smart-compile-alist 'risky-local-variable t)

(defconst smart-compile-replace-alist '(
  ("<span class="quote">%F</span>" . (buffer-file-name))
  ("<span class="quote">%f</span>" . (file-name-nondirectory (buffer-file-name)))
  ("<span class="quote">%n</span>" . (file-name-sans-extension
           (file-name-nondirectory (buffer-file-name))))
  ("<span class="quote">%e</span>" . (or (file-name-extension (buffer-file-name)) "<span class="quote"></span>"))
  ("<span class="quote">%o</span>" . smart-compile-option-string)
<span class="linecomment">;;   ("%U" . (user-login-name))</span>
  ))
(put 'smart-compile-replace-alist 'risky-local-variable t)

(defvar smart-compile-check-makefile t)
(make-variable-buffer-local 'smart-compile-check-makefile)

(defcustom smart-compile-make-program "<span class="quote">make </span>"
  "<span class="quote">The command by which to invoke the make program.</span>"
  :type 'string
  :group 'smart-compile)

(defcustom smart-compile-option-string "<span class="quote"></span>"
  "<span class="quote">The option string that replaces %o.  The default is empty.</span>"
  :type 'string
  :group 'smart-compile)


<span class="linecomment">;;;###autoload</span>
(defun smart-compile (&optional arg)
  "<span class="quote">An interface to `compile'.
It calls `compile' or other compile function,
which is defined in `smart-compile-alist'.</span>"
  (interactive "<span class="quote">p</span>")
  (let ((name (buffer-file-name))
        (not-yet t))
    
    (if (not name)(error "<span class="quote">cannot get filename.</span>"))
<span class="linecomment">;;     (message (number-to-string arg))</span>

    (cond

     <span class="linecomment">;; local command</span>
     <span class="linecomment">;; The prefix 4 (C-u M-x smart-compile) skips this section</span>
     <span class="linecomment">;; in order to re-generate the compile-command</span>
     ((and (not (= arg 4)) <span class="linecomment">; C-u M-x smart-compile</span>
           (local-variable-p 'compile-command)
           compile-command)
      (call-interactively 'compile)
      (setq not-yet nil)
      )

     <span class="linecomment">;; make?</span>
     ((and smart-compile-check-makefile
           (or (file-readable-p "<span class="quote">Makefile</span>")
               (file-readable-p "<span class="quote">makefile</span>")))
      (if (y-or-n-p "<span class="quote">Makefile is found.  Try 'make'? </span>")
          (progn
            (set (make-local-variable 'compile-command) "<span class="quote">make </span>")
            (call-interactively 'compile)
            (setq not-yet nil)
            )
        (setq smart-compile-check-makefile nil)))

     ) <span class="linecomment">;; end of (cond ...)</span>

    <span class="linecomment">;; compile</span>
    (let( (alist smart-compile-alist) 
          (case-fold-search nil)
          (function nil) )
      (while (and alist not-yet)
        (if (or
             (and (symbolp (caar alist))
                  (eq (caar alist) major-mode))
             (and (stringp (caar alist))
                  (string-match (caar alist) name))
             )
            (progn
              (setq function (cdar alist))
              (if (stringp function)
                  (progn
                    (set (make-local-variable 'compile-command)
                         (smart-compile-string function))
                    (call-interactively 'compile)
                    )
                (if (listp function)
                    (eval function)
                    ))
              (setq alist nil)
              (setq not-yet nil)
              )
          (setq alist (cdr alist)) )
        ))

    <span class="linecomment">;; If compile-command is not defined and the contents begins with "#!",</span>
    <span class="linecomment">;; set compile-command to filename.</span>
    (if (and not-yet
             (not (memq system-type '(windows-nt ms-dos)))
             (not (string-match "<span class="quote">/\\.[^/]+$</span>" name))
             (not
              (and (local-variable-p 'compile-command)
                   compile-command))
             )
        (save-restriction
          (widen)
          (if (equal "<span class="quote">#!</span>" (buffer-substring 1 (min 3 (point-max))))
              (set (make-local-variable 'compile-command) name)
            ))
      )
    
    <span class="linecomment">;; compile</span>
    (if not-yet (call-interactively 'compile) )

    ))

(defun smart-compile-string (format-string)
  "<span class="quote">Document forthcoming...</span>"
  (if (and (boundp 'buffer-file-name)
           (stringp buffer-file-name))
      (let ((rlist smart-compile-replace-alist)
            (case-fold-search nil))
        (while rlist
          (while (string-match (caar rlist) format-string)
            (setq format-string
                  (replace-match
                   (eval (cdar rlist)) t nil format-string)))
          (setq rlist (cdr rlist))
          )
        ))
  format-string)

(provide 'smart-compile)

<span class="linecomment">;;; smart-compile.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=smart-compile.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_smart-compile.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=smart-compile.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=smart-compile.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=smart-compile.el">Administration</a></span><!-- test --><span class="time"><br /> Last edited 2012-07-10 16:00 UTC by <a class="author" title="from ai126212134006.5.tik.access-internet.ne.jp" href="http://www.emacswiki.org/emacs/zenitani">zenitani</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=smart-compile.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
