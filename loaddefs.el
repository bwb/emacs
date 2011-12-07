;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "elisp/bwb-ace-jump-mode" "elisp/bwb-ace-jump-mode.el"
;;;;;;  (20191 51674))
;;; Generated autoloads from elisp/bwb-ace-jump-mode.el

(require 'ace-jump-mode)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)

;;;***

;;;### (autoloads nil "elisp/bwb-auto-complete" "elisp/bwb-auto-complete.el"
;;;;;;  (20191 51674))
;;; Generated autoloads from elisp/bwb-auto-complete.el

(require 'auto-complete-config)

(setq ac-comphist-file (concat user-emacs-directory ".autocomplete.history"))

(ac-config-default)

;;;***

;;;### (autoloads nil "elisp/bwb-c" "elisp/bwb-c.el" (20191 51674))
;;; Generated autoloads from elisp/bwb-c.el

(eval-after-load 'c-mode (progn (require 'cc-mode) (require 'flymake) (setq c-default-style "linux") (define-key c-mode-map (kbd "C-c C-c") 'compile) (add-hook 'c-mode-hook 'flymake-find-file-hook)))

;;;***

;;;### (autoloads (bwb-clojure-save-buffers) "elisp/bwb-clojure"
;;;;;;  "elisp/bwb-clojure.el" (20191 51674))
;;; Generated autoloads from elisp/bwb-clojure.el

(autoload 'bwb-clojure-save-buffers "elisp/bwb-clojure" "\


\(fn)" nil nil)

(eval-after-load 'clojure-mode (defadvice clojure-test-run-tests (before bwb-clojure-test-run-tests-advice) "Always save `clojure-mode' buffers before running tests." (bwb-clojure-save-buffers)))

;;;***

;;;### (autoloads nil "elisp/bwb-dired" "elisp/bwb-dired.el" (20191
;;;;;;  51674))
;;; Generated autoloads from elisp/bwb-dired.el

(require 'dired-x)

(require 'find-dired)

(require 'tassilo-horn)

(setq dired-omit-files "^\\..*")

(define-key dired-mode-map (kbd "^") 'th-dired-up-directory)

(define-key dired-mode-map (kbd "RET") 'th-dired-find-file)

(setq find-ls-option '("-print0 | xargs -0 ls -ld" . "-ld"))

;;;***

;;;### (autoloads nil "elisp/bwb-ediff" "elisp/bwb-ediff.el" (20191
;;;;;;  51674))
;;; Generated autoloads from elisp/bwb-ediff.el

(require 'ediff)

(setq ediff-split-window-function 'split-window-horizontally)

;;;***

;;;### (autoloads nil "elisp/bwb-ess" "elisp/bwb-ess.el" (20191 51674))
;;; Generated autoloads from elisp/bwb-ess.el

(autoload 'R "ess-site" "\
ESS" t)

(autoload 'r-mode "ess-site" "\
ESS" t)

(add-to-list 'auto-mode-alist '("\\.R$" . r-mode))

;;;***

;;;### (autoloads nil "elisp/bwb-ido" "elisp/bwb-ido.el" (20191 51674))
;;; Generated autoloads from elisp/bwb-ido.el

(require 'ido)

(setq ido-enable-flex-matching t ido-everywhere t ido-create-new-buffer 'always)

(ido-mode t)

;;;***

;;;### (autoloads nil "elisp/bwb-multi-term" "elisp/bwb-multi-term.el"
;;;;;;  (20191 51674))
;;; Generated autoloads from elisp/bwb-multi-term.el

(require 'multi-term)

(setq multi-term-program "/bin/bash")

(defun bwb-multi-term-fix-line-mode-binding nil (define-key term-raw-map (kbd "C-c C-j") 'term-line-mode))

(add-hook 'term-mode-hook 'bwb-multi-term-fix-line-mode-binding)

(setq term-unbind-key-list '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>"))

(setq term-bind-key-alist '(("M-d" . term-send-forward-kill-word) ("C-DEL" . term-send-backward-kill-word) ("M-DEL" . term-send-backward-kill-word) ("C-c C-c" . term-interrupt-subjob) ("C-p" . previous-line) ("C-n" . next-line) ("C-s" . isearch-forward) ("C-r" . isearch-backward) ("C-m" . term-send-raw) ("M-f" . term-send-forward-word) ("M-b" . term-send-backward-word) ("M-o" . term-send-backspace) ("M-p" . term-send-up) ("M-n" . term-send-down) ("M-M" . term-send-forward-kill-word) ("M-N" . term-send-backward-kill-word) ("M-r" . term-send-reverse-search-history) ("M-," . term-send-input)))

(global-set-key (kbd "C-c t") 'multi-term-next)

(global-set-key (kbd "C-c T") 'multi-term)

;;;***

;;;### (autoloads nil "elisp/bwb-p4" "elisp/bwb-p4.el" (20191 51674))
;;; Generated autoloads from elisp/bwb-p4.el

(require 'p4)

;;;***

;;;***

;;;***

;;;### (autoloads nil "elisp/bwb-paredit" "elisp/bwb-paredit.el"
;;;;;;  (20191 56121))
;;; Generated autoloads from elisp/bwb-paredit.el

(autoload 'enable-paredit-mode "paredit")

(add-hook 'clojure-mode-hook 'enable-paredit-mode)

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

;;;***

;;;### (autoloads (bwb-python-virtualenv-postdeactivate bwb-python-virtualenv-postactivate
;;;;;;  bwb-python-update-command) "elisp/bwb-python" "elisp/bwb-python.el"
;;;;;;  (20191 51674))
;;; Generated autoloads from elisp/bwb-python.el

(autoload 'bwb-python-update-command "elisp/bwb-python" "\
Set `python-command' to `command'.
The next shell command to run a Python interpreter will use
`command'.

\(fn COMMAND)" nil nil)

(autoload 'bwb-python-virtualenv-postactivate "elisp/bwb-python" "\
Set `python-command' to use the newly activated virtualenv.

\(fn VIRTUALENV)" nil nil)

(autoload 'bwb-python-virtualenv-postdeactivate "elisp/bwb-python" "\
Set `python-command' to use the default python command.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "elisp/bwb-re-builder" "elisp/bwb-re-builder.el"
;;;;;;  (20191 51674))
;;; Generated autoloads from elisp/bwb-re-builder.el

(eval-after-load 're-builder (setq reb-re-syntax 'string))

;;;***

;;;### (autoloads nil "elisp/bwb-rnc" "elisp/bwb-rnc.el" (20191 51674))
;;; Generated autoloads from elisp/bwb-rnc.el

(autoload 'rnc-mode "rnc-mode")

(add-to-list 'auto-mode-alist '("\\.rnc$" . rnc-mode))

(eval-after-load 'rnc-mode (setq rnc-indent-level 2))

;;;***

;;;### (autoloads nil "elisp/bwb-rst" "elisp/bwb-rst.el" (20191 51674))
;;; Generated autoloads from elisp/bwb-rst.el

(eval-after-load 'rst-mode (progn (require 'rst) (add-hook 'rst-adjust-hook 'rst-toc-update) (setq rst-toc-insert-max-level 2) (define-key rst-mode-map (kbd "C-M-a") 'rst-backward-section) (define-key rst-mode-map (kbd "C-M-e") 'rst-forward-section)))

;;;***

;;;### (autoloads nil "elisp/bwb-show-paren" "elisp/bwb-show-paren.el"
;;;;;;  (20191 51674))
;;; Generated autoloads from elisp/bwb-show-paren.el

(require 'paren)

(show-paren-mode t)

(setq show-paren-style 'mixed show-paren-delay 0 blink-matching-paren nil)

;;;***

;;;### (autoloads nil "elisp/bwb-slime" "elisp/bwb-slime.el" (20191
;;;;;;  51674))
;;; Generated autoloads from elisp/bwb-slime.el

(eval-after-load 'slime-mode (progn (require 'ac-slime) (add-hook 'slime-mode-hook 'set-up-slime-ac) (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)))

;;;***

;;;### (autoloads nil "elisp/bwb-smex" "elisp/bwb-smex.el" (20191
;;;;;;  51674))
;;; Generated autoloads from elisp/bwb-smex.el

(require 'smex)

(smex-initialize)

(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-x C-m") 'smex)

(global-set-key (kbd "C-c C-m") 'smex)

(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-x m") 'smex)

;;;***

;;;### (autoloads nil "elisp/bwb-uniquify" "elisp/bwb-uniquify.el"
;;;;;;  (20191 51674))
;;; Generated autoloads from elisp/bwb-uniquify.el

(require 'uniquify)

(setq uniquify-buffer-name-style 'forward)

;;;***

;;;### (autoloads nil "elisp/bwb-vc" "elisp/bwb-vc.el" (20191 51674))
;;; Generated autoloads from elisp/bwb-vc.el

(setq vc-handled-backends nil)

;;;***

;;;### (autoloads nil "elisp/bwb-whitespace" "elisp/bwb-whitespace.el"
;;;;;;  (20191 51674))
;;; Generated autoloads from elisp/bwb-whitespace.el

(require 'whitespace)

(setq whitespace-line-column 80)

(setq whitespace-style '(face trailing space-before-tab space-after-tab lines-tail))

(setq whitespace-global-modes '(not calendar-mode dired-mode inferior-python-mode term-mode))

(global-whitespace-mode)

;;;***

;;;### (autoloads nil "elisp/bwb-woman" "elisp/bwb-woman.el" (20191
;;;;;;  51674))
;;; Generated autoloads from elisp/bwb-woman.el

(require 'woman)

(add-to-list 'woman-manpath "/usr/local/git/share/man")

;;;***

;;;### (autoloads nil "elisp/bwb-yasnippet" "elisp/bwb-yasnippet.el"
;;;;;;  (20191 56071))
;;; Generated autoloads from elisp/bwb-yasnippet.el

(require 'yasnippet)

(yas/initialize)

(setq yas/root-directory (list (concat user-emacs-directory "snippets") (car (file-expand-wildcards (concat user-emacs-directory "elpa/yasnippet*/snippets")))))

(mapc 'yas/load-directory yas/root-directory)

(add-to-list 'ac-sources 'ac-complete-yasnippet)

;;;***

;;;### (autoloads nil nil ("elisp/bwb-flymake.el" "elisp/bwb-js2.el"
;;;;;;  "elisp/bwb.el") (20191 56149 434871))

;;;***

(provide 'loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; loaddefs.el ends here
