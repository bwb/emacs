;;; Customize `occur' and related functions.

;;;###autoload
(progn
  (require 'occur-x)
  (add-hook 'occur-mode-hook 'turn-on-occur-x-mode))
