;;; Configure `rnc-mode'.

(autoload 'rnc-mode "rnc-mode" "Edit Relax-NG Compact schema files.")
(add-to-list 'auto-mode-alist '("\\.rnc$" . rnc-mode))
(add-hook 'rnc-mode-hook
          (lambda ()
            (setq rnc-indent-level 2)))
;; TODO add a command that runs ~/emacs/vendor/trang on the current
;; buffer.

(provide 'bwb-rnc)
