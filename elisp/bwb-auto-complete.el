;;; Configure `auto-complete' mode.
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/emacs/autocomplete-dictionaries")
(add-to-list 'ac-modes 'slime-repl-mode)
(setq ac-comphist-file "~/emacs/autocomplete.history")
(ac-config-default)
(defun bwb-auto-complete-yasnippet-source ()
  "Append `ac-source-yasnippet' to `ac-sources'.
Use mode hooks set buffer-local `ac-sources'."
  (setq ac-sources (append ac-sources '(ac-source-yasnippet))))

(add-hook 'python-mode-hook 'bwb-auto-complete-yasnippet-source)

(provide 'bwb-auto-complete)
