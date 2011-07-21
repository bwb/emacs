;;;; Configure `rst-mode'.  Edit reStructuredText.

(require 'rst)

(add-hook 'rst-adjust-hook 'rst-toc-update)
(add-hook 'rst-mode-hook
          (lambda ()
            (setq rst-toc-insert-max-level 2)))
(add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))

;; By default `rst-mode' uses the `beginning-of-defun' binding for
;; `rst-forward-section', and the `end-of-defun' binding for
;; `rst-backward-section'.  This feels backwards.  Swap the bindings.
(define-key rst-mode-map (kbd "C-M-a") 'rst-backward-section)
(define-key rst-mode-map (kbd "C-M-e") 'rst-forward-section)

;;; TODO Write a command (or snippet) to generate :ROLE:`INTERPRETED
;;; TEXT <BLAH>`

(provide 'bwb-rst)
