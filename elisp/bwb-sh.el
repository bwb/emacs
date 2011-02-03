;;; Configure `sh-mode'.
(require 'bwb)

(add-hook 'sh-mode-hook
          'bwb-80-column-warning)

(provide 'bwb-sh)
