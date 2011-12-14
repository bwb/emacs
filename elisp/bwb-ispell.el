;;; Customize `ispell'.

;;;###autoload
(progn
  (require 'ispell)
  (setq ispell-personal-dictionary (concat user-emacs-directory "ispell.dict")))
