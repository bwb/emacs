;;; Configure `c-mode'.
(require 'bwb)

(setq c-default-style "linux")
;; http://emacsblog.org/2007/02/10/quick-tip-defining-mode-specific-key-bindings/
;; http://xahlee.org/emacs/keyboard_shortcuts.html
(add-hook 'c-mode-hook
          (lambda ()
            (define-key c-mode-map (kbd "C-c C-c") 'compile)
            (setq fill-column 78)
            (bwb-80-column-warning)))

(provide 'bwb-c)
