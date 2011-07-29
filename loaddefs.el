;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "bwb-ace-jump-mode" "elisp/bwb-ace-jump-mode.el"
;;;;;;  (20018 54906))
;;; Generated autoloads from elisp/bwb-ace-jump-mode.el

(require 'ace-jump-mode)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)

;;;***

;;;### (autoloads nil "bwb-auto-complete" "elisp/bwb-auto-complete.el"
;;;;;;  (20018 56548))
;;; Generated autoloads from elisp/bwb-auto-complete.el

(require 'auto-complete-config)

(setq ac-comphist-file (concat user-emacs-directory ".autocomplete.history"))

(ac-config-default)

;;;***

;;;### (autoloads nil "bwb-c" "elisp/bwb-c.el" (20018 53945))
;;; Generated autoloads from elisp/bwb-c.el

(eval-after-load 'c-mode (progn (require 'cc-mode) (require 'flymake) (setq c-default-style "linux") (define-key c-mode-map (kbd "C-c C-c") 'compile) (add-hook 'c-mode-hook 'flymake-find-file-hook)))

;;;***

;;;### (autoloads (bwb-clojure-save-buffers) "bwb-clojure" "elisp/bwb-clojure.el"
;;;;;;  (20018 11773))
;;; Generated autoloads from elisp/bwb-clojure.el

(autoload 'bwb-clojure-save-buffers "bwb-clojure" "\
Not documented

\(fn)" nil nil)

(eval-after-load 'clojure-mode (defadvice clojure-test-run-tests (before bwb-clojure-test-run-tests-advice) "Always save `clojure-mode' buffers before running tests." (bwb-clojure-save-buffers)))

;;;***

;;;### (autoloads nil "bwb-dired" "elisp/bwb-dired.el" (20018 55044))
;;; Generated autoloads from elisp/bwb-dired.el

(require 'dired-x)

(require 'find-dired)

(require 'tassilo-horn)

(setq dired-omit-files "^\\..*")

(define-key dired-mode-map (kbd "^") 'th-dired-up-directory)

(define-key dired-mode-map (kbd "RET") 'th-dired-find-file)

(setq find-ls-option '("-print0 | xargs -0 ls -ld" . "-ld"))

;;;***

;;;### (autoloads nil "bwb-ediff" "elisp/bwb-ediff.el" (20018 55139))
;;; Generated autoloads from elisp/bwb-ediff.el

(require 'ediff)

(setq ediff-split-window-function 'split-window-horizontally)

;;;***

;;;### (autoloads nil "bwb-ess" "elisp/bwb-ess.el" (20018 9990))
;;; Generated autoloads from elisp/bwb-ess.el

(autoload 'R "ess-site" "\
ESS" t)

(autoload 'r-mode "ess-site" "\
ESS" t)

(add-to-list 'auto-mode-alist '("\\.R$" . r-mode))

;;;***

;;;### (autoloads nil "bwb-ido" "elisp/bwb-ido.el" (20018 55164))
;;; Generated autoloads from elisp/bwb-ido.el

(require 'ido)

(setq ido-enable-flex-matching t ido-everywhere t ido-create-new-buffer 'always)

(ido-mode t)

;;;***

;;;### (autoloads nil "bwb-js2" "elisp/bwb-js2.el" (20018 54023))
;;; Generated autoloads from elisp/bwb-js2.el

(eval-after-load 'js2-mode (progn (setq js2-bounce-indent-p t js2-consistent-level-indent-inner-bracket-p t js2-pretty-multiline-decl-indentation-p t)))

;;;***

;;;### (autoloads nil "bwb-multi-term" "elisp/bwb-multi-term.el"
;;;;;;  (20018 57801))
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

;;;### (autoloads nil "bwb-p4" "elisp/bwb-p4.el" (20018 55816))
;;; Generated autoloads from elisp/bwb-p4.el

(require 'p4)

;;;***

;;;### (autoloads (bwb-paredit-enable) "bwb-paredit" "elisp/bwb-paredit.el"
;;;;;;  (20018 56124))
;;; Generated autoloads from elisp/bwb-paredit.el

(autoload 'bwb-paredit-enable "bwb-paredit" "\
Not documented

\(fn)" nil nil)

(add-hook 'clojure-mode-hook 'bwb-paredit-enable)

(add-hook 'emacs-lisp-mode-hook 'bwb-paredit-enable)

;;;***

;;;### (autoloads (bwb-python-virtualenv-postdeactivate bwb-python-virtualenv-postactivate
;;;;;;  bwb-python-update-command) "bwb-python" "elisp/bwb-python.el"
;;;;;;  (20017 35701))
;;; Generated autoloads from elisp/bwb-python.el

(autoload 'bwb-python-update-command "bwb-python" "\
Set `python-command' to `command'.
The next shell command to run a Python interpreter will use
`command'.

\(fn COMMAND)" nil nil)

(autoload 'bwb-python-virtualenv-postactivate "bwb-python" "\
Set `python-command' to use the newly activated virtualenv.

\(fn VIRTUALENV)" nil nil)

(autoload 'bwb-python-virtualenv-postdeactivate "bwb-python" "\
Set `python-command' to use the default python command.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "bwb-re-builder" "elisp/bwb-re-builder.el"
;;;;;;  (20018 52578))
;;; Generated autoloads from elisp/bwb-re-builder.el

(eval-after-load 're-builder (setq reb-re-syntax 'string))

;;;***

;;;### (autoloads nil "bwb-rnc" "elisp/bwb-rnc.el" (20018 52833))
;;; Generated autoloads from elisp/bwb-rnc.el

(autoload 'rnc-mode "rnc-mode")

(add-to-list 'auto-mode-alist '("\\.rnc$" . rnc-mode))

(eval-after-load 'rnc-mode (setq rnc-indent-level 2))

;;;***

;;;### (autoloads nil "bwb-rst" "elisp/bwb-rst.el" (20018 54129))
;;; Generated autoloads from elisp/bwb-rst.el

(eval-after-load 'rst-mode (progn (require 'rst) (add-hook 'rst-adjust-hook 'rst-toc-update) (setq rst-toc-insert-max-level 2) (define-key rst-mode-map (kbd "C-M-a") 'rst-backward-section) (define-key rst-mode-map (kbd "C-M-e") 'rst-forward-section)))

;;;***

;;;### (autoloads nil "bwb-show-paren" "elisp/bwb-show-paren.el"
;;;;;;  (20018 55847))
;;; Generated autoloads from elisp/bwb-show-paren.el

(require 'paren)

(show-paren-mode t)

(setq show-paren-style 'mixed show-paren-delay 0 blink-matching-paren nil)

;;;***

;;;### (autoloads nil "bwb-slime" "elisp/bwb-slime.el" (20018 54653))
;;; Generated autoloads from elisp/bwb-slime.el

(eval-after-load 'slime-mode (progn (require 'ac-slime) (add-hook 'slime-mode-hook 'set-up-slime-ac) (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)))

;;;***

;;;### (autoloads nil "bwb-smex" "elisp/bwb-smex.el" (20018 55890))
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

;;;### (autoloads nil "bwb-uniquify" "elisp/bwb-uniquify.el" (20018
;;;;;;  55923))
;;; Generated autoloads from elisp/bwb-uniquify.el

(require 'uniquify)

(setq uniquify-buffer-name-style 'forward)

;;;***

;;;### (autoloads nil "bwb-vc" "elisp/bwb-vc.el" (20018 56026))
;;; Generated autoloads from elisp/bwb-vc.el

(setq vc-handled-backends nil)

;;;***

;;;### (autoloads nil "bwb-whitespace" "elisp/bwb-whitespace.el"
;;;;;;  (20018 56056))
;;; Generated autoloads from elisp/bwb-whitespace.el

(require 'whitespace)

(setq whitespace-line-column 80)

(setq whitespace-style '(face trailing space-before-tab space-after-tab lines-tail))

(setq whitespace-global-modes '(not calendar-mode dired-mode inferior-python-mode term-mode))

(global-whitespace-mode)

;;;***

;;;### (autoloads nil "bwb-woman" "elisp/bwb-woman.el" (20018 56286))
;;; Generated autoloads from elisp/bwb-woman.el

(require 'woman)

(add-to-list 'woman-manpath "/usr/local/git/share/man")

;;;***

;;;### (autoloads nil "bwb-yasnippet" "elisp/bwb-yasnippet.el" (20018
;;;;;;  56086))
;;; Generated autoloads from elisp/bwb-yasnippet.el

(require 'yasnippet)

(yas/initialize)

(setq yas/root-directory (list (concat user-emacs-directory "snippets") (concat user-emacs-directory "vendor/yasnippet/snippets")))

(mapc 'yas/load-directory yas/root-directory)

(add-to-list 'ac-sources 'ac-complete-yasnippet)

;;;***

;;;### (autoloads (js2-mode) "js2-mode" "../emacs/vendor-git/js2-mode/js2-mode.el"
;;;;;;  (19973 25326))
;;; Generated autoloads from ../emacs/vendor-git/js2-mode/js2-mode.el
 (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload 'js2-mode "js2-mode" "\
Major mode for editing JavaScript code.

\(fn)" t nil)

;;;***

;;;### (autoloads (rst-minor-mode rst-mode) "rst" "../emacs/vendor/rst.el"
;;;;;;  (19852 4764))
;;; Generated autoloads from ../emacs/vendor/rst.el
 (add-to-list 'auto-mode-alist (purecopy '("\\.re?st\\'" . rst-mode)))

(autoload 'rst-mode "rst" "\
Major mode for editing reStructuredText documents.
\\<rst-mode-map>

There are a number of convenient keybindings provided by Rst
mode. The main one is \\[rst-adjust], it updates or rotates the
section title around point or promotes/demotes the adornments
within the region (see full details below). Use negative prefix
arg to rotate in the other direction.

Turning on `rst-mode' calls the normal hooks `text-mode-hook'
and `rst-mode-hook'.  This mode also supports font-lock
highlighting.

\\{rst-mode-map}

\(fn)" t nil)

(autoload 'rst-minor-mode "rst" "\
ReST Minor Mode.
Toggle ReST minor mode.
With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

When ReST minor mode is enabled, the ReST mode keybindings
are installed on top of the major mode bindings.  Use this
for modes derived from Text mode, like Mail mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("elisp/bwb-flymake.el" "elisp/bwb.el")
;;;;;;  (20018 59765 950298))

;;;***

(provide 'loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; loaddefs.el ends here
