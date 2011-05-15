;;; Configure `js2-mode'.
(require 'bwb)
(require 'js2-mode)

;;(autoload 'js2-mode "js2-mode" "A better js-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq
             js2-bounce-indent-p t
             js2-consistent-level-indent-inner-bracket-p t
             js2-pretty-multiline-decl-indentation-p t)))

(provide 'bwb-js2)
