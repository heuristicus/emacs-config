;; Japanese fonts

;; U+4E00–U+9FBF Kanji

(set-fontset-font "fontset-default"
		  (cons (decode-char 'ucs #x4e00)
                            (decode-char 'ucs #x9fbf))
                      "-*-Droid Sans-normal-normal-normal-*-15-*-*-*-d-0-iso10646-1")

;; U+3040–U+309F Hiragana

(set-fontset-font "fontset-default"
		  (cons (decode-char 'ucs #x3040)
                            (decode-char 'ucs #x309f))
                      "-*-Droid Sans-normal-normal-normal-*-15-*-*-*-d-0-iso10646-1")

;; U+30A0–U+30FF Katakana

(set-fontset-font "fontset-default"
		  (cons (decode-char 'ucs #x30a0)
                            (decode-char 'ucs #x30ff))
                      "-*-Droid Sans-normal-normal-normal-*-15-*-*-*-d-0-iso10646-1")

;; Set default font for separate frames so that emacsclient has the same font size
(add-to-list 'default-frame-alist
             '(font . "Inconsolata-10"))

;; Set default font for everything.
(if (eq window-system 'x)
    (set-default-font "Inconsolata-10"))

(provide 'fonts-custom)
