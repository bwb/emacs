;;; Configure `writegood-mode'.

;;;###autoload
(progn
  (require 'writegood-mode)
  (define-key global-map (kbd "C-c g") 'writegood-mode))
