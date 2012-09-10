;;; Configure `rnc-mode'.

;;;###autoload
(progn
  (autoload 'rnc-mode "rnc-mode")
  (add-to-list 'auto-mode-alist '("\\.rnc$" . rnc-mode))
  (eval-after-load 'rnc-mode
    '(setq rnc-indent-level 2)))
