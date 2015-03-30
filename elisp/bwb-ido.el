;;; Configure "Interactively Do Things" mode.
;;
;; This site offers good advice:
;; http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/

;;;###autoload
(progn
  (require 'ido)
  (require 'ido-ubiquitous)
  (setq ido-enable-flex-matching t
        ido-everywhere t
        ido-use-filename-at-point 'guess
        ido-create-new-buffer 'always
        ido-max-directory-size 100000
        ido-use-virtual-buffers t
        ido-save-directory-list-file (concat user-emacs-directory ".ido.last"))
  (ido-mode t)
  (ido-ubiquitous-mode t))
