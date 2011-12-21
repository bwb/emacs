;;; Customize `yaml-mode'.

;;; Don't expect too much...

;; "YAML is easy to write but complex to parse, and this mode doesn't
;; even really try.  Indentation and highlighting will break on
;; abnormally complicated structures."

;;;###autoload
(defun bwb-yaml-customize ()
  (define-key yaml-mode-map "\C-m" 'newline-and-indent))

;;;###autoload
(progn
  ;; A future version of yaml-mode may contain autoload comments,
  ;; avoiding the need to load at startup.
  (require 'yaml-mode)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-hook 'yaml-mode-hook 'bwb-yaml-customize))
