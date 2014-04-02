;;; Configure `ace-*' modes.

;;;###autoload
(progn
  (require 'ace-jump-mode)
  (require 'ace-link)
  (ace-link-setup-default)
  (define-key global-map (kbd "C-;") 'ace-jump-mode)
  (define-key global-map (kbd "C-M-;") 'ace-jump-buffer)
  (define-key global-map (kbd "M-p") 'ace-window))
