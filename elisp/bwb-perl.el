;;; Configure `perl-mode', and hope not to use it.
(require 'bwb)

(add-hook 'perl-mode-hook 'bwb-80-column-warning)

(provide 'bwb-perl)
