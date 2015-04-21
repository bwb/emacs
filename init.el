;;; Brandon Barry's Emacs.
;;
;; Thanks to all (direct and indirect) Emacs contributors.

;;; `user-emacs-directory'
;;
;; http://www.emacswiki.org/emacs/DotEmacsDotD
;;
;; Keep all Emacs cusomization in the `user-emacs-directory',
;; `~/.emacs.d/'.
;;
;; I make `~/.emacs.d' a link to `~/emacs', and manage `~/emacs' with
;; Git.  Note that the `user-emacs-directory' may fill with caches,
;; configuration files, and other clutter.  You can customize this
;; behavior in most cases.

;;; `~/emacs/init.el'
;;
;; http://www.emacswiki.org/emacs/InitFile
;;
;; You are reading the init file.  When text refers to `~/.emacs' or
;; just `.emacs', use this file instead.

;;; `~/emacs/packages'
;;
;; http://www.emacswiki.org/emacs/ELPA
;; http://melpa.org/
;;
;; Emacs 24+ has built-in package management.

(setq package-user-dir (concat user-emacs-directory "packages"))
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'package+)
  (package-install 'package+))
;; TODO investigate startup error:
;; "Couldn't install package: (error Error during download request: Not Found)"
(package-manifest
 'ace-jump-buffer
 'ace-jump-mode
 'ace-link
 'ace-window
 'company
 'company-go
 'dockerfile-mode
 'epc
 'exec-path-from-shell
 'go-eldoc
 'go-mode
 'go-snippets
 'ido-ubiquitous
 'js2-mode
 'json-mode
 'keyfreq
 'lua-mode
 'markdown-mode
 'multi-term
 'occur-x
 ;; Without this entry `package+' deletes itself.
 'package+
 'paredit
 'paredit-everywhere
 'protobuf-mode
 'rnc-mode
 'smex
 'typing
 'writegood-mode
 'yaml-mode
 'yasnippet)

;;; `~/emacs/elisp'
;;
;; First and second party Emacs Lisp libraries (and related files)
;; belong here.
;;
;; Using autoloaded `progn's in separate files for simple changes
;; helps reduce the size and complexity of the init file.  For
;; example, to change some bindings in `butterfly-mode', add this to
;; `~/emacs/elisp/bwb-butterfly.el':
;;
;;   ;;;###autoload
;;   (progn
;;     (global-set-key (kbd "C-M-S-SPC-RET") 'btrfly-flap-wings))
;;
;; Thanks to the autoload setup below no other changes are required.

(setq bwb-elisp-dir (concat user-emacs-directory "elisp"))
(add-to-list 'load-path bwb-elisp-dir)

;;; Require essential libraries.

(eval-when-compile (require 'cl))
(require 'bwb)

;;; Perform OS-specific initialization.

(cond
((string-match "linux" system-configuration)
 (bwb-init-linux))
((string-match "darwin" system-configuration)
 (bwb-init-mac-os-x))
(t
 (message "no `system-configuration' specific settings found")))

;;; Perform hostname-specific initialization.

(cond
((string= system-name "bos-mpndw")
 (bwb-init-bos-mpndw))
((string= system-name "work")
 (bwb-init-work))
(t
(message "no `system-name' specific settings found")))

;;; Autoload additional libraries.
;;
;; http://www.gnu.org/software/emacs/elisp/html_node/Autoload.html
;;
;; ELPA packages provide their own autoload files.
;; `package-initialize' loads them.

(setq bwb-elisp-autoload-file (concat bwb-elisp-dir "/elisp-autoloads.el"))
(bwb-regen-autoloads bwb-elisp-autoload-file bwb-elisp-dir)
(require 'elisp-autoloads)

;;; `~/emacs/backup'
;;
;; http://www.emacswiki.org/emacs/BackupDirectory
;; http://www.emacswiki.org/emacs/AutoSave
;;
;; Store Emacs' backup and auto-save files in a single directory.
;; Otherwise you'll someday find yourself running "find mumble mumble
;; -delete".  You should probably "chmod go=" this directory.

(setq bwb-backup-directory (concat user-emacs-directory "backup")
      backup-directory-alist `((".*" . ,bwb-backup-directory))
      auto-save-file-name-transforms `((".*" ,bwb-backup-directory t)))

;; Disable backups when using tramp to avoid leaking secrets.
(add-to-list 'backup-directory-alist
             '(tramp-file-name-regexp . nil) t)

;;; Set global variables.

(setq browse-url-browser-function 'browse-url-generic
      ;; must set browse-url-generic-program in OS-specific setup
      column-number-mode t
      enable-recursive-minibuffers t
      indicate-empty-lines t
      inhibit-startup-screen t
      require-final-newline "ask"
      visible-bell t)

;;; Set buffer-local defaults.

(setq-default indent-tabs-mode nil
              imenu-auto-rescan t)

;;; Bind keys globally (some modes add their own global bindings).

;; Many sources suggest swapping the bindings for normal and regex
;; search.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-C-s") 'isearch-forward)
(global-set-key (kbd "M-C-r") 'isearch-backward)
;; `ibuffer-mode' offers more than `buff-menu+'
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Don't sleep Emacs accidentally.  Suggested by drhoades in a Hacker
;; News .emacs discussion
(global-set-key (kbd "C-z") nil)
;; Open the link at point in the url-generic-program.
(global-set-key (kbd "C-x ;") 'browse-url)
(global-set-key (kbd "C-x C-i") 'imenu)
;;; Don't `insert-file' accidentally.
(global-set-key (kbd "C-x i") 'imenu)

;;; Miscellaneous settings.

;; Enable narrowing.
(put 'narrow-to-region 'disabled nil)
;; Set character encoding.
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'auto-tail-revert-mode 'tail-mode)

;;; Start processes.

(server-start)
(multi-term)
