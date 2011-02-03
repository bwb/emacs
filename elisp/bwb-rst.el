;;; Configure `rst-mode'.  Edit reStructuredText.
(require 'rst)

(add-hook 'rst-adjust-hook 'rst-toc-update)
(add-hook 'rst-mode-hook
          (lambda ()
            (setq rst-toc-insert-max-level 2)))
(add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))

(provide 'bwb-rst)
