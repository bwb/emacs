;;; Configure `c++-mode'.

;;;###autoload
(defun bwb-c++-customize ()
  (require 'google-c-style)
  (require 'flymake)
  (add-hook 'c++-mode-hook 'google-set-c-style)
  (add-hook 'c++-mode-hook 'google-make-newline-indent)
  (add-hook 'c++-mode-hook 'flymake-find-file-hook)
  (define-key c++-mode-map (kbd "C-c C-c") 'compile))

;;;###autoload
(progn
  (add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
  (eval-after-load 'cc-mode
    '(bwb-c++-customize)))
