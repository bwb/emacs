;;; Configure `re-builder'.

;;;###autoload
(eval-after-load 're-builder
  ;; From http://www.masteringemacs.org/
  ;; "C-c C-w" yanks the current regex to the `kill-ring'.
  '(setq reb-re-syntax 'string))
