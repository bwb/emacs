;;; Configure `paredit-mode'.

(defvar bwb-paredit-nospace '()
  "`paredit' won't add a delimiting space for major modes in this list.")

(autoload
  'enable-paredit-mode
  "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

;;; Similar to esk-paredit-nonlisp in the Emacs Starter Kit.
;;; https://github.com/technomancy/emacs-starter-kit
(defun bwb-paredit-space-for-delimiter-p (endp delimiter)
  "Return t if mode not in non-lisp paredit modes."
  (not (member major-mode 'bwb-paredit-nospace)))

(eval-after-load 'paredit
  '(add-to-list 'paredit-space-for-delimiter-predicates
                'bwb-paredit-space-for-delimiter-p))

;;; Add curly-brace support when necessary.
(defun bwb-paredit-curly (mode-map)
  "Enable curly braces in `paredit-mode' for MODE-MAP.
First seen in `clojure-mode'."
  (define-key mode-map "{" 'paredit-open-curly)
  (define-key mode-map "}" 'paredit-close-curly-and-newline))

;;; Decouple `paredit' configuration from configuration of the modes
;;; that use it.  Otherwise attempts to disable `paredit' or the modes
;;; that use it by commenting out the relevant
;;;
;;; (require bwb-MODE-LIBRARY)
;;;
;;; line in the init file will fail.

(eval-after-load 'bwb-clojure
  '(add-hook 'clojure-mode-hook 'enable-paredit-mode))

(eval-after-load 'bwb-emacs-lisp
  '(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode))

;;; FIXME `js2-mode' and `paredit-mode' don't work well together.
;; (eval-after-load 'bwb-js2
;;   '(progn
;;      (add-to-list 'bwb-paredit-nospace 'js2-mode)
;;      (bwb-paredit-curly js2-mode-map)
;;      (add-hook 'js2-mode-hook 'enable-paredit-mode)))

(eval-after-load 'bwb-slime
  '(progn
     (bwb-paredit-curly slime-mode-map)
     (add-hook 'slime-mode-hook 'enable-paredit-mode)))

(provide 'bwb-paredit)
