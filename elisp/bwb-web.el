;;; Configure `web-mode'.
;;;
;;; http://web-mode.org/

;;;###autoload
(progn
  (require 'web-mode)
  (setq web-mode-markup-indent-offset 2
        web-mode-enable-auto-pairing t)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-hook 'web-mode-hook 'bwb-company-conf))
