(defmacro with-silent-modifications (&rest body)
  "Execute BODY, pretending it does not modify the buffer.
If BODY performs real modifications to the buffer's text, other
than cosmetic ones, undo data may become corrupted.
Typically used around modifications of text-properties which do not really
affect the buffer's content."
  (declare (debug t) (indent 0))
  (let ((modified (make-symbol "modified")))
    `(let* ((,modified (buffer-modified-p))
            (buffer-undo-list t)
            (inhibit-read-only t)
            (inhibit-modification-hooks t)
            deactivate-mark
            ;; Avoid setting and removing file locks and checking
            ;; buffer's uptodate-ness w.r.t the underlying file.
            buffer-file-name
            buffer-file-truename)
       (unwind-protect
           (progn
             ,@body)
         (unless ,modified
           (restore-buffer-modified-p nil))))))

(provide 'commands-custom)