;;; Configure `ace-jump-mode', `ace-jump-buffer', and `ace-window'.

;;;###autoload
(progn
  (require 'ace-jump-mode)
  (define-key global-map (kbd "C-;") 'ace-jump-mode)
  (define-key global-map (kbd "C-M-;") 'ace-jump-buffer)
  (define-key global-map (kbd "M-p") 'ace-window))
