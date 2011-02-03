;;; Configure `rnc-mode'.

(autoload 'rnc-mode "rnc-mode" "Edit Relax-NG Compact schema files.")
(add-to-list 'auto-mode-alist '("\\.rnc$" . rnc-mode))

(provide 'bwb-rnc)
