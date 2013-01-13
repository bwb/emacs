;;; Configure `gtags'.

;;;###autoload
(defun bwb-gtags-select-customize ()
  (hl-line-mode t)
  ;; `gtags-suggested-key-mapping' binds too many keys, and doesn't
  ;; work as expected.
  (define-key gtags-select-mode-map (kbd "RET") 'gtags-select-tag))

;;;###autoload
(defun bwb-gtags-customize ()
  (define-key gtags-mode-map (kbd "M-.") 'gtags-find-tag)
  (define-key gtags-mode-map (kbd "M-,") 'gtags-find-rtag))

;;;###autoload
(progn
  (autoload 'gtags-mode "gtags" "GNU GLOBAL Source Code Tag System" t)
  (add-hook 'gtags-mode-hook 'bwb-gtags-customize)
  (add-hook 'gtags-select-mode-hook 'bwb-gtags-select-customize))
