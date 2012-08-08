;;; Configure `protobuf-mode'.

;;;###autoload
(eval-after-load 'protobuf-mode
  (progn
    (require 'cc-mode)
    (defun bwb-protobuf-indent ()
      (set-variable 'c-basic-offset 2))
    (add-hook 'protobuf-mode-hook 'bwb-protobuf-indent)))
