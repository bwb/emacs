;;;; Configure `rst-mode'.  Edit reStructuredText.

(require 'rst)

(add-hook 'rst-adjust-hook 'rst-toc-update)
(add-hook 'rst-mode-hook
          (lambda ()
            (setq rst-toc-insert-max-level 2)))
(add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))

;;; TODO Write a command (or snippet) to generate :ROLE:`INTERPRETED
;;; TEXT <BLAH>`

(provide 'bwb-rst)
