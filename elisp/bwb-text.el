;;; Configure `text-mode'.

;;;###autoload
(progn
  (add-hook 'text-mode-hook 'bwb-activate-auto-fill-mode)
  (add-hook 'text-mode-hook 'bwb-activate-flyspell-mode))
