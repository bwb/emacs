;;; Configure "Emacs Speaks Statistics" mode (ESS), so we can use R.
;;
;; Load ESS on visiting *.R and after invoking "M-x R".

;;;###autoload
(progn
  (autoload 'R "ess-site" "ESS" t)
  (autoload 'r-mode "ess-site" "ESS" t)
  (add-to-list 'auto-mode-alist '("\\.R$" . r-mode)))
