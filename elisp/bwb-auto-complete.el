;;; Configure `auto-complete' mode.
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/emacs/autocomplete-dictionaries")
(add-to-list 'ac-modes 'slime-repl-mode)
(setq ac-comphist-file "~/emacs/autocomplete.history")
(ac-config-default)

(provide 'bwb-auto-complete)
