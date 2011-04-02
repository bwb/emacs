;;; Configure `multi-term' mode to manage multiple terminal buffers.
(require 'multi-term)

(setq multi-term-program "/bin/bash")

;; Rebind word kill commands.  Otherwise WYSI*NOT*WYG!
(add-to-list 'term-bind-key-alist
             '("M-DEL" . term-send-backward-kill-word))
(add-to-list 'term-bind-key-alist
             '("C-DEL" . term-send-backward-kill-word))
(add-to-list 'term-bind-key-alist
             '("M-d" . term-send-forward-kill-word))

(define-key term-raw-map (kbd "C-c C-j") 'term-line-mode)

(add-hook 'term-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))

(provide 'bwb-multi-term)
