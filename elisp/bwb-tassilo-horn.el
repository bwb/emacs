;; Configure some code written by Tassilo Horn.

(add-hook 'dired-mode-hook
          (lambda ()
            (require 'tassilo-horn)
            (th-dired-mode-init)))

(provide 'bwb-tassilo-horn)
