;;; Configure `auto-complete' mode.

;;;###autoload
(progn
  (require 'auto-complete-config)
  (setq ac-comphist-file (concat user-emacs-directory ".autocomplete.history")
        ac-quick-help-delay 0.2)
  (ac-config-default))
