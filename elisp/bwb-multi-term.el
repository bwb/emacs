;;; Configure `multi-term' mode to manage multiple terminal buffers.

;;;###autoload
(progn
  (require 'multi-term)

  (setq multi-term-program "/bin/bash")

  (defun bwb-multi-term-fix-line-mode-binding ()
    (define-key term-raw-map (kbd "C-c C-j") 'term-line-mode))

  (defun bwb-multi-term-disable-yas-minor-mode ()
    (yas-minor-mode -1))

  (add-hook 'term-mode-hook 'bwb-multi-term-fix-line-mode-binding)
  (add-hook 'term-mode-hook 'bwb-multi-term-disable-yas-minor-mode)

  (defun bwb-multi-term-coding-system ()
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))

  (add-hook 'term-exec-hook 'bwb-multi-term-coding-system)

  (setq term-unbind-key-list
        '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>"))
  ;; Rebind word kill commands.  Otherwise WYSI*NOT*WYG!
  (setq term-bind-key-alist
        '(("C-c C-c" . term-interrupt-subjob)
          ;; Command line movement
          ("M-f" . term-send-forward-word)              ; forward-word
          ("M-b" . term-send-backward-word)             ; backward-word
          ;; Command line editing
          ("M-d" . term-send-forward-kill-word)         ; forward-kill-word
          ("M-M" . term-send-forward-kill-word)         ; forward-kill-word
          ("M-DEL" . term-send-raw-meta)                ; backward-kill-word
          ("M-N" . term-send-backward-kill-word)        ; unix-word-rubout?!
          ("M-o" . term-send-backspace)
          ;; History movement
          ("M-p" . term-send-up)
          ("M-n" . term-send-down)
          ("M-r" . term-send-reverse-search-history)
          ("M-." . term-send-raw-meta)
          ;; Buffer movement
          ("C-p" . previous-line)
          ("C-n" . next-line)
          ("C-s" . isearch-forward-regexp)
          ("C-r" . isearch-backward-regexp)
          ;; Misc
          ("C-m" . term-send-raw)
          ("M-," . term-send-input)
          ;; TODO fix broken bindings. Investigate readline, ~/.inputrc
          ("C-DEL" . term-send-backward-kill-word)
          ))
  (global-set-key (kbd "C-x t") 'multi-term-next)
  (global-set-key (kbd "C-x T") 'multi-term))
