;;; Configure `show-paren-mode'.
(require 'paren)

(show-paren-mode t)
(setq
 ;; alternatives: 'expression, 'parentheses
 show-paren-style 'mixed
 show-paren-delay 0
 blink-matching-paren nil)

(provide 'bwb-show-paren)
