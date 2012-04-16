;;; Configure `nxml-mode'.
;;;
;;; TODO find out why the vacuous schema is used by default in some
;;; cases, even though `rng-auto-set-schema-and-validate' locates the
;;; desired schema.

;;;###autoload
(progn
  (defun bwb-nxml-add-schema-locating-file ()
    ;; http://infohost.nmt.edu/tcc/help/pubs/nxml/default-schemas.html
    (add-to-list 'rng-schema-locating-files
                 (concat (getenv "HOME") "/.nxml/schemas.xml")))
  (add-hook 'nxml-mode-hook 'bwb-nxml-add-schema-locating-file))
