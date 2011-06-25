;;;; Configure the Superior Lisp Interaction Mode for Emacs.

;;; `clojure-jack-in' and the `swank-clojure' leiningen plugin do most
;;; of the work.

(require 'ac-slime)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))

(provide 'bwb-slime)
