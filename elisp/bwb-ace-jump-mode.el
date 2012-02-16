;;; Configure `ace-jump-mode'.

;;;###autoload
(progn
  (require 'ace-jump-mode)
  (define-key global-map (kbd "C-;") 'ace-jump-mode))
