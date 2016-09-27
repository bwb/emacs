;;; Configure `magit-mode'.

;;;###autoload
(with-eval-after-load 'magit-mode
  (global-set-key (kbd "<f10>") 'magit-status))
