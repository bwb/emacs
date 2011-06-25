;;;; Configure `auto-complete' mode.

(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/emacs/autocomplete-dictionaries")
(setq ac-comphist-file "~/emacs/autocomplete.history")
(ac-config-default)

(defun bwb-auto-complete-yasnippet ()
  "Append `ac-source-yasnippet' to `ac-sources'.
Use mode hooks to set buffer-local `ac-sources'."
  (setq ac-sources (append ac-sources '(ac-source-yasnippet))))

(add-hook 'perl-mode-hook 'bwb-auto-complete-yasnippet)
(add-hook 'python-mode-hook 'bwb-auto-complete-yasnippet)
(add-hook 'clojure-mode-hook 'bwb-auto-complete-yasnippet)

(provide 'bwb-auto-complete)
