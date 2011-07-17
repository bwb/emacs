;;;; Configure `clojure-mode'.

(require 'bwb)
(require 'clojure-mode)

(add-hook 'clojure-mode-hook
          (lambda ()
            (bwb-80-column-warning)
            ;; TODO buffer-local require-final-newline
            ;; (setq require-final-newline t)
            ))
(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)
(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)

(provide 'bwb-clojure)
