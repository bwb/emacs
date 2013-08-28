;;; Configure `ace-jump-mode' and `ace-jump-buffer'.

;;;###autoload
(progn
  (require 'ace-jump-mode)
  (define-key global-map (kbd "C-;") 'ace-jump-mode)
  (define-key global-map (kbd "C-M-;") 'ace-jump-buffer))
