;;; Configure `show-paren-mode'.

;;;###autoload
(progn
  (require 'paren)
  (show-paren-mode t)
  (setq
   ;; alternatives: 'expression, 'parentheses
   show-paren-style 'mixed
   show-paren-delay 0
   blink-matching-paren nil))
