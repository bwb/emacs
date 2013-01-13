;;; Configure `js2-mode'.
;;
;; https://github.com/mooz/js2-mode/tree/emacs24
;;
;; Continue using javascript-mode for JSON files.

;;;###autoload
(progn
  (autoload 'js2-mode "js2-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))

(provide 'bwb-js2)
