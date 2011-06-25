;;;; Configure `perl-mode', and hope not to use it.

(require 'bwb)

;; Perl test scripts.
(add-to-list 'auto-mode-alist '("\\.t$" . perl-mode))
(add-hook 'perl-mode-hook 'bwb-80-column-warning)

(provide 'bwb-perl)
