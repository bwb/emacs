;;; Configure `rst-mode'.  Edit reStructuredText.

;;;###autoload
(eval-after-load 'rst-mode
  '(progn
     (require 'rst)
     (add-hook 'rst-adjust-hook 'rst-toc-update)
     (setq rst-toc-insert-max-level 2)
     ;; By default `rst-mode' uses the `beginning-of-defun' binding for
     ;; `rst-forward-section', and the `end-of-defun' binding for
     ;; `rst-backward-section'.  This feels backwards.  Swap the bindings.
     (define-key rst-mode-map (kbd "C-M-a") 'rst-backward-section)
     (define-key rst-mode-map (kbd "C-M-e") 'rst-forward-section)))
