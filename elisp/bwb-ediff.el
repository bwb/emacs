;;; Configure `ediff'.

;;;###autoload
(progn
  (require 'ediff)
  (setq ediff-split-window-function 'split-window-horizontally
        ediff-window-setup-function 'ediff-setup-windows-plain))
