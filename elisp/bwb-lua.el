;;; Configure `lua-mode'.

;;;###autoload
(defun bwb-lua-conf ()
  (setq lua-indent-level 2))

;;;###autoload
(progn
  (add-hook 'lua-mode-hook 'bwb-lua-conf))
