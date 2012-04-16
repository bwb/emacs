;;; Configure `multi-term' mode to manage multiple terminal buffers.

;;;###autoload
(progn
  (require 'multi-term)

  (setq multi-term-program "/bin/bash")

  (defun bwb-multi-term-fix-line-mode-binding ()
    (define-key term-raw-map (kbd "C-c C-j") 'term-line-mode))
  (add-hook 'term-mode-hook 'bwb-multi-term-fix-line-mode-binding)

  (defun bwb-multi-term-coding-system ()
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
  (add-hook 'term-exec-hook 'bwb-multi-term-coding-system)

  (setq term-unbind-key-list
        '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>"))
  ;; Rebind word kill commands.  Otherwise WYSI*NOT*WYG!
  (setq term-bind-key-alist
        '(("M-d" . term-send-forward-kill-word)
          ("C-DEL" . term-send-backward-kill-word)
          ("M-DEL" . term-send-backward-kill-word)
          ("C-c C-c" . term-interrupt-subjob)
          ("C-p" . previous-line)
          ("C-n" . next-line)
          ("C-s" . isearch-forward)
          ("C-r" . isearch-backward)
          ("C-m" . term-send-raw)
          ("M-f" . term-send-forward-word)
          ("M-b" . term-send-backward-word)
          ("M-o" . term-send-backspace)
          ("M-p" . term-send-up)
          ("M-n" . term-send-down)
          ("M-M" . term-send-forward-kill-word)
          ("M-N" . term-send-backward-kill-word)
          ("M-r" . term-send-reverse-search-history)
          ("M-," . term-send-input)
          ("M-." . term-send-raw-meta)
          ))
  ;; http://emacs-fu.blogspot.com/2010/06/console-apps-in-emacs-with-multi-term.html
  ;; suggests binding these functions.
  (global-set-key (kbd "C-c t") 'multi-term-next)
  (global-set-key (kbd "C-c T") 'multi-term))
