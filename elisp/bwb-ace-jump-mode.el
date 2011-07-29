;;; Configure `ace-jump-mode'.

;;;###autoload
(progn
  (require 'ace-jump-mode)
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
  ;; Forgive butterfinters.
  (define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode))
