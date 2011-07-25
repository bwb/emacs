;;; Brandon Barry's Emacs.
;;
;; Thanks to all (direct and indirect) Emacs contributors.  If you're
;; new to Emacs, start here: http://www.gnu.org/software/emacs/tour/

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
(setq bwb-elisp-dir (concat user-emacs-directory "elisp"))
(add-to-list 'load-path bwb-elisp-dir)

;;; `~/emacs/vendor'
;;
;; Store downloaded third party Emacs Lisp libraries (and related
;; files) here.  Consider adding all of these libraries to an ELPA
;; repo.
(setq bwb-vendor-dir (concat user-emacs-directory "vendor"))
(add-to-list 'load-path bwb-vendor-dir)

;;; `~/emacs/vendor-git'
;;
;; Store cloned third parth Emacs Lisp libraries (and related files)
;; here (as Git submodules).  Consider adding all of these libraries
;; to an ELPA repo.
;;
;; See https://git.wiki.kernel.org/index.php/GitSubmoduleTutorial for
;; submodule removal instructions.
(setq bwb-vendor-git-dir (concat user-emacs-directory "vendor-git"))
(add-to-list 'load-path bwb-vendor-git-dir)

;;; Emacs Lisp Package Archive (ELPA)
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

;;; Require frequently used libraries.
(require 'bwb)
(require 'bwb-ace-jump-mode)
(require 'bwb-buff-menu+)
(require 'bwb-dired)
(require 'bwb-ediff)
(require 'bwb-ido)
(require 'bwb-multi-term)
(require 'bwb-smex)
(require 'bwb-uniquify)

;;; Autoload additional libraries.
;;
;; http://www.gnu.org/software/emacs/elisp/html_node/Autoload.html
;;
;; ELPA packages provide their own autoload files.
;; `package-initialize' loads them.
(setq bwb-autoload-file (concat user-emacs-directory "loaddefs.el"))
;; TODO `update-file-autoloads', `update-directory-autoloads'.
(setq generated-autoload-file bwb-autoload-file)
(load bwb-autoload-file)

;;; TODO configure
;;
;; auto-complete
;; c
;; calendar
;; clojure
;; emacs-lisp
;; erc
;; ess
;; flymake
;; javascript support


;;; `~/emacs/backup'
;;
;; http://www.emacswiki.org/emacs/BackupDirectory
;; http://www.emacswiki.org/emacs/AutoSave
;;
;; Store Emacs' backup and auto-save files in a single directory.
;; Otherwise you'll someday find yourself running "find mumble mumble
;; -delete".  You should probably "chmod go=" this directory.
(setq
 bwb-backup-directory (concat user-emacs-directory "backup")
 ;; TODO this doesn't seem to work.
 auto-save-file-name-transforms `((".*" ,bwb-backup-directory t))
 backup-directory-alist `((".*" . ,bwb-backup-directory))
 tramp-auto-save-directory bwb-backup-directory)

(add-to-list 'load-path "~/emacs/elisp")
;; (add-to-list 'load-path "~/emacs/vendor")
;; (add-to-list 'load-path "~/emacs/vendor/ess/lisp")
;; (add-to-list 'load-path "~/emacs/vendor/yasnippet")
;; ;; Use the `vendor-git' subdirectory for Git submodules.
;; (add-to-list 'load-path "~/emacs/vendor-git/ac-slime")
;; (add-to-list 'load-path "~/emacs/vendor-git/auto-complete")
;; (add-to-list 'load-path "~/emacs/vendor-git/clojure-mode")
;; (add-to-list 'load-path "~/emacs/vendor-git/js2-mode")
;; (add-to-list 'load-path "~/emacs/vendor-git/markdown-mode")
;; (add-to-list 'load-path "~/emacs/vendor-git/smex")

;;;; Mode-specific Configuration

;;; Emacs will run for a long time once started.  Don't worry about
;;; optimizing load time until it becomes a problem.  Keep
;;; configuration details for each mode in a separate library.  Do not
;;; rely on the order below.  Load the `bwb' library if necessary.
;;;
;;;   (require 'bwb) ; OK
;;;   ...
;;;   (provide 'bwb-MODE-FOO)
;;;
;;; Do not load one `bwb-MODE-LIBRARY' from another
;;; `bwb-MODE-LIBRARY'.  That way madness lies.  Maybe use
;;; `eval-after-load', but only if necessary.
;;;
;;;   (require 'bwb-MODE-BAR) ; NO
;;;   ...
;;;   (provide 'bwb-MODE-FOO)

;; (require 'bwb-auto-complete)
;; (require 'bwb-c)
;; (require 'bwb-calendar)
;; (require 'bwb-clojure)
;; (require 'bwb-emacs-lisp)
;; ;; Seems to load minor modes globally
;; ;; (require 'bwb-erc)              ; IRC client
;; (require 'bwb-ess)              ; Emacs Speaks Statistics
;; (require 'bwb-flymake)          ; Check syntax on the fly
;; (require 'bwb-js2)              ; Edit JavaScript
;; (require 'bwb-markdown-mode)    ; Simpler than reStructuredText
;; ;;; FIXME problem with P4PORT
;; ;;(require 'bwb-p4)               ; Perforce integration
;; (require 'bwb-paredit)          ; "Pseudostructural" Lisp code editing
;; (require 'bwb-perl)
;; (require 'bwb-python)
;; (require 'bwb-re-builder)
;; (require 'bwb-rnc)              ; Relax NG compact schema (`nxml-mode')
;; (require 'bwb-rst)              ; reStructuredText
;; (require 'bwb-sh)
;; (require 'bwb-show-paren)
;; (require 'bwb-slime)            ; The Superior Lisp Interaction Mode for Emacs
;; (require 'bwb-steve-yegge)
;; (require 'bwb-uniquify)         ; Improve buffer disambiguation.
;; (require 'bwb-woman)            ; Read manual pages without an external program
;; (require 'bwb-vc)               ; Interact with version control systems
;; (require 'bwb-yasnippet)        ; Expand abbreviations into text templates

;;;; OS-specific Initialization

(cond
 ((string-match "darwin" system-configuration)
  (bwb-init-mac-os-x))
 ((string-match "linux" system-configuration)
  (bwb-init-linux))
 (t
  (message "unknown system - no system-specific settings applied")))

;;; Buffer Local Defaults

(setq-default
 indent-tabs-mode nil
 show-trailing-whitespace t)

;;; Miscellaneous Global Variables

(setq
 ;; must set browse-url-generic-program in OS-specific setup
 browse-url-browser-function 'browse-url-generic
 column-number-mode t
 default-directory "~/"
 indicate-empty-lines t
 inhibit-startup-screen t
 require-final-newline t
 ;; Use C-<SPC> C-<SPC> to set the mark at point and enable transient
 ;; mark until the mark is deactivated.  Use C-u C-x C-x to activate
 ;; the mark and enable transient mark until the mark is next
 ;; deactivated.
 transient-mark-mode nil
 visible-bell 'top-bottom
 )

;;; Global Keybindings (some modes add their own)

;; Don't sleep Emacs accidentally.  Suggested by drhoades in a Hacker
;; News .emacs discussion
(global-set-key (kbd "C-z") nil)
;; Open the link at point in the url-generic-program.
(global-set-key (kbd "C-x ;") 'browse-url)

;;; Enable (default disabled) Commands

(put 'narrow-to-region 'disabled nil)

;;; Character Encoding

(prefer-coding-system 'utf-8)

;;; Start programs.

(server-start)
(multi-term)

;;; TODO
;;
;; `whitespace-mode'!
;;
;; Find a better way to update submodules to later commits.
;;
;; Use the autoload feature where appropriate.
;; `update-directory-autoloads' seems useful.
;;
;; Add more snippets.  Add `bwb-auto-complete-yasnippet' to more mode
;; hooks.
;;
;; Fix `multi-term': missing word boundaries, broken forward-delete,
;; broken C-DEL (see C-backspace), and the lack of support for Bash
;; M-. and M-*.
;;
;; Work on `bwb'.
;;
;; Work on `bwb-js2-mode'.
;;
;; Work on `bwb-python-mode'.
;;
;; Add spell checking with `flyspell-mode' and `flyspell-prog-mode'
;; where appropriate.
;;
;; Perform (periodic?) byte compilation with
;; `byte-recompile-directory'.
;;
;; Enable `imenu' with `ido-completing-read' and automatic rescans.
;;
;; Finish `bwb-rnc-trang-current-buffer'.

;; init.el ends here
