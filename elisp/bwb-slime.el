;;;; Configure the Superior Lisp Interaction Mode for Emacs.

;;; The current `slime-repl' comes from the Clojure contributors.  It
;;; is supposedly limited (when compared to `slime-fancy'), but seems
;;; powerful enough for now.

(require 'slime)
(require 'ac-slime)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))
(slime-setup '(slime-repl))

(provide 'bwb-slime)
