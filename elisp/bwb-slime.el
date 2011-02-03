;;; Configure the Superior Lisp Interaction Mode for Emacs.
;;;
;;; The current `slime-repl' comes from the Clojure contributors.  It
;;; is supposedly limited (when compared to `slime-fancy'), but seems
;;; powerful enough for now.
(require 'slime)
(require 'ac-slime)

;;; TODO paredit-open-curly, paredit-close-curly.
(add-hook 'slime-mode-hook 'enable-paredit-mode)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(slime-setup '(slime-repl))

(provide 'bwb-slime)
