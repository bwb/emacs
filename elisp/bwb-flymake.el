;;; Configure "on-the" `flymake-mode'.

;;;###autoload
(eval-after-load 'flymake
  '(progn
    (setq flymake-gui-warnings-enabled nil)
    ;; TODO investigate simple v. master init. If there's a reason to
    ;; use a master file when checking header files, find a way to
    ;; customize `flymake-master-make-header-init', so *.cc files can
    ;; serve as master files.
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.h$" flymake-simple-make-init))
    (require 'flymake-cursor)))
