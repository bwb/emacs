;;; Configure `keyfreq-mode' and `keyfreq-autosave-mode'

;;;###autoload
(progn
  (require 'keyfreq)
  (setq keyfreq-file (concat user-emacs-directory ".keyfreq")
        keyfreq-file-lock (concat keyfreq-file ".lock"))
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))
