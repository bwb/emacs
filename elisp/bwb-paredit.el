;;; Configure `paredit-mode'.

(autoload
  'enable-paredit-mode
  "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

;;; Decouple `paredit' configuration from configuration of the modes
;;; that use it.  Otherwise attempts to disable `paredit' or the modes
;;; that use it by commenting out the relevant
;;;
;;; (require bwb-MODE-LIBRARY)
;;;
;;; line in the init file will fail.

(eval-after-load 'bwb-clojure
  '(add-hook 'clojure-mode-hook 'enable-paredit-mode))

(eval-after-load 'bwb-emacs-lisp
  '(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode))

(provide 'bwb-paredit)
