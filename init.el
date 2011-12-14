;;; Brandon Barry's Emacs.
;;
;; Thanks to all (direct and indirect) Emacs contributors.

;; If you're new to Emacs, start here:
;; http://www.gnu.org/software/emacs/tour/
;; http://batsov.com/articles/2011/11/30/the-ultimate-collection-of-emacs-resources/
;;
;; Try the Emacs Starter Kit.
;; https://github.com/technomancy/emacs-starter-kit

;;; `user-emacs-directory'
;;
;; http://www.emacswiki.org/emacs/DotEmacsDotD
;;
;; Keep all Emacs cusomization in the `user-emacs-directory',
;; `~/.emacs.d'.
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
;;     (global-set-key (kbd "C-M-S-SPC-RET") 'btrfly-flap-wings)
;;     (global-set-key))
;;
;; Thanks to the autoload setup below no other changes are required.

(setq bwb-elisp-dir (concat user-emacs-directory "elisp"))
(add-to-list 'load-path bwb-elisp-dir)

;;; `~/emacs/vendor'
;;
;; Store downloaded third party Emacs Lisp libraries (and related
;; files) here.  Consider adding all of these libraries to an ELPA
;; repo.  Some libraries are in subdirectories.

(setq bwb-vendor-dir (concat user-emacs-directory "vendor"))
(add-to-list 'load-path bwb-vendor-dir)
(add-to-list 'load-path (concat  bwb-vendor-dir "/ess/lisp"))

;;; `~/emacs/elpa'
;;
;; http://www.emacswiki.org/emacs/ELPA
;;
;; Use Emacs' new package manager when possible, despite its flaws.
;;
;; https://github.com/technomancy/emacs-starter-kit

(setq package-user-dir (concat user-emacs-directory "elpa"))
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

;;; Require essential libraries.

(eval-when-compile (require 'cl))
(require 'bwb)

;;; Autoload additional libraries.
;;
;; http://www.gnu.org/software/emacs/elisp/html_node/Autoload.html
;;
;; ELPA packages provide their own autoload files.
;; `package-initialize' loads them.

;; TODO cleanup
(setq bwb-elisp-autoload-file (concat bwb-elisp-dir "/elisp-autoloads.el"))
(bwb-regen-autoloads bwb-elisp-autoload-file bwb-elisp-dir)
(require 'elisp-autoloads)
(setq bwb-vendor-autoload-file (concat bwb-vendor-dir "/vendor-autoloads.el"))
(bwb-regen-autoloads bwb-vendor-autoload-file bwb-elisp-dir)
(require 'vendor-autoloads)

;;; TODO byte-recompile-directory
;; (byte-recompile-directory bwb-elisp-dir 0)
;; (byte-recompile-directory bwb-vendor-dir 0)

;;; Perform OS-specific initialization.

(cond
 ((string-match "darwin" system-configuration)
  (bwb-init-mac-os-x))
 ((string-match "linux" system-configuration)
  (bwb-init-linux))
 (t
  (message "unknown system - no system-specific settings applied")))

;;; `~/emacs/backup'
;;
;; http://www.emacswiki.org/emacs/BackupDirectory
;; http://www.emacswiki.org/emacs/AutoSave
;;
;; Store Emacs' backup and auto-save files in a single directory.
;; Otherwise you'll someday find yourself running "find mumble mumble
;; -delete".  You should probably "chmod go=" this directory.

(setq bwb-backup-directory (concat user-emacs-directory "backup")
      ;; TODO this doesn't seem to work.
      auto-save-file-name-transforms `((".*" ,bwb-backup-directory t))
      backup-directory-alist `((".*" . ,bwb-backup-directory))
      tramp-auto-save-directory bwb-backup-directory)

;;; Set global variables.

(setq browse-url-browser-function 'browse-url-generic
      ;; must set browse-url-generic-program in OS-specific setup
      column-number-mode t
      indicate-empty-lines t
      inhibit-startup-screen t
      require-final-newline t
      ;; Use C-<SPC> C-<SPC> to set the mark at point and enable
      ;; transient mark until the mark is deactivated.  Use C-u C-x
      ;; C-x to activate the mark and enable transient mark until the
      ;; mark is next deactivated.
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
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'auto-tail-revert-mode 'tail-mode)

;;; Start processes.

(server-start)
(multi-term)

;; TODO

;; Use *-init funcs with add-hook rather than lambdas (lambdas could be
;; added repeatedly).

;; Use autoloads in bwb-vendor-dir and bwb-vendor-git-dir.

;; Find a better way to update submodules to later commits.

;; Add more snippets.  Append `ac-source-yasnippet' to `ac-sources' for
;; more modes.

;; Fix `multi-term': missing word boundaries, broken forward-delete,
;; broken C-DEL (see C-backspace), and the lack of support for Bash
;; M-. and M-*.

;; Add spell checking with `flyspell-mode' and `flyspell-prog-mode'
;; where appropriate.

;; Perform (periodic?) byte compilation with
;; `byte-recompile-directory'.

;; Enable `imenu' with `ido-completing-read' and automatic rescans.

;; Finish `bwb-rnc-trang-current-buffer'.

;; Use `file-name-as-directory' where appropriate.

;; Investigate startup errors related to `bwb-autoload-file'
;; (re)generation, `global-font-lock-mode-check-buffers', and the use of
;; `post-command-hook' in `bwb-flymake-mode'

;; Remove unused Git submodules.

;; Browse emacswiki.org, github.com (especially the ESK) for good
;; ideas.

;; Use `bwb-dir' and `bwb-path', or find a better path manipulation
;; library and use it.

;; See what version two of the Emacs Starter Kit has to offer.  It's
;; modular and requires Emacs 24.
