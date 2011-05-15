;;; Configure `clojure-mode'.
(require 'bwb)
(require 'clojure-mode)

(add-hook 'clojure-mode-hook 'bwb-80-column-warning)
(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)
(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)

(provide 'bwb-clojure)
