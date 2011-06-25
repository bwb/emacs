;;;; Configure `js2-mode'.

(require 'bwb)
(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; TODO pick a mode (js2-mode with warnings and errors disabled or
;; js-mode) for use with JSON files.
;; TODO use mozrepl, swank-js, or another method of evaluating code.
(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq
             js2-bounce-indent-p t
             js2-consistent-level-indent-inner-bracket-p t
             js2-pretty-multiline-decl-indentation-p t)))

(provide 'bwb-js2)
