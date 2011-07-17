;;;; Configure `calendar-mode'.
(require 'calendar)

(add-hook 'calendar-initial-window-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))

(provide 'bwb-calendar)
