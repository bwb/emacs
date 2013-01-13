;;; Configure `c++-mode'.

;;;###autoload
(defun bwb-c++-activate-gtags ()
  (gtags-mode t))

;;; TODO maybe move some of this to `c-mode-common-hook'
;;;###autoload
(defun bwb-c++-customize ()
  (require 'flymake)
  (require 'google-c-style)
  (add-hook 'c++-mode-hook 'bwb-c++-activate-gtags)
  (add-hook 'c++-mode-hook 'flymake-find-file-hook)
  (add-hook 'c++-mode-hook 'google-set-c-style)
  (add-hook 'c++-mode-hook 'google-make-newline-indent)
  (define-key c++-mode-map (kbd "C-c C-c") 'compile))

;;;###autoload
(progn
  (add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
  (eval-after-load 'cc-mode
    '(bwb-c++-customize)))
