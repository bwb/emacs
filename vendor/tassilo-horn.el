;;; Avoid using multiple dired buffers when possible.
;;
;; Thanks Tassilo Horn.

(defun th-dired-up-directory ()
  "Display the parent directory in this dired buffer."
  (interactive)
  (find-alternate-file ".."))

(defun th-dired-find-file ()
  "Find directories using this dired buffer; use a new buffer for files."
  (interactive)
  (if (file-directory-p (dired-get-file-for-visit))
      (dired-find-alternate-file)
    (dired-find-file)))

(provide 'tassilo-horn)
