;;; Customize `yaml-mode'.

;;; Don't expect too much...

;; "YAML is easy to write but complex to parse, and this mode doesn't
;; even really try.  Indentation and highlighting will break on
;; abnormally complicated structures."

;;;###autoload
(defun bwb-yaml-customize ()
  (define-key yaml-mode-map "\C-m" 'newline-and-indent))
