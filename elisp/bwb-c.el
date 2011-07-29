;;; Configure `c-mode'.

;;;###autoload
(eval-after-load 'c-mode
  (progn
    (require 'cc-mode)
    (require 'flymake)
    (setq c-default-style "linux")
    (define-key c-mode-map (kbd "C-c C-c") 'compile)
    (add-hook 'c-mode-hook 'flymake-find-file-hook)))
