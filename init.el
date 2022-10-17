;;; Brandon Barry's Emacs setup.
;;;
;;; Thanks to all who contribute to Emacs.

;;; `user-emacs-directory'
;;; http://www.emacswiki.org/emacs/DotEmacsDotD
;;;
;;; Keep all Emacs customization here.
;;;
;;; I make the `user-emacs-directory', `~/.emacs.d', a link to
;;; `~/emacs'. Changes are tracked by Git.  Note that the
;;; `user-emacs-directory' may fill with caches, configuration files,
;;; and other clutter.  You can customize this behavior in most cases.

;;; `~/emacs/init.el'
;;; http://www.emacswiki.org/emacs/InitFile
;;;
;;; You are reading the init file.  When text refers to `~/.emacs' or
;;; just `.emacs', use this file instead.

;; Don't use the `custom-file'.
(setq custom-file (concat user-emacs-directory ".unused-custom.el"))
;; Don't sleep Emacs accidentally.
(global-set-key (kbd "C-z") nil)

;; Mitigate Bug#28350 (security) in Emacs 25.2 and earlier.
;; http://seclists.org/oss-sec/2017/q3/422
(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))

;;; `~/emacs/packages'
;;; http://www.emacswiki.org/emacs/ELPA
;;; http://melpa.org/
;;;
;;; Emacs 24+ has built-in package management.

(setq package-user-dir (concat user-emacs-directory "packages"))
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; `use-package' helps reduce the size and complexity of Emacs
;; configuration.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package anzu
  :ensure t
  :config
  (global-anzu-mode +1))

;; http://oremacs.com/2015/05/08/avy-0.1.0/
(use-package avy
  :ensure t
  :config
  (setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (global-set-key (kbd "C-;") 'avy-goto-char-2))

;; TODO bind more avy commands, use package `ace-link'.

;; `ace-window' depends on `avy', and has the same author.
(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(use-package browse-url
  :config
  (setq browse-url-browser-function 'browse-url-generic)
  ;; Open the link at point in the url-generic-program.
  (global-set-key (kbd "C-x ;") 'browse-url))

(use-package cider
  :ensure t
  :config
  (setq cider-repl-pop-to-buffer-on-connect 'display-only
        cider-repl-use-pretty-printing t)
  (add-hook 'cider-mode-hook 'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-repl-mode-hook 'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-repl-mode-hook 'paredit-mode))

(use-package clojure-mode
  :ensure t
  :config
  (add-hook 'clojure-mode-hook 'paredit-mode))

(use-package clojure-mode-extra-font-locking
  :ensure t)

(use-package clojure-snippets
  :ensure t)

(use-package company
  :ensure t
  ;; TODO use custom faces
  :config
  (define-key company-mode-map (kbd "M-SPC") 'company-complete)
  (setq company-tooltip-limit 20
        company-idle-delay nil)
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-go
  :ensure t
  :config
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-go)))

(use-package company-web
  :ensure t)

(use-package dired
  :config
  ;; Functions from Tassilo Horn.
  (defun th-dired-up-directory ()
    "Display the parent directory in this dired buffer."
    (interactive)
    (find-alternate-file ".."))

  (defun th-dired-find-file ()
    "Find directories using this dired buffer; use a new buffer for files."
    (interactive)
    (if (file-directory-p (dired-get-file-for-visit))
        (dired-find-alternate-file)
      (dired-find-file)))

  (when (string= system-type "darwin")
    (setq dired-use-ls-dired nil))

  (setq dired-dwim-target t)
  (define-key dired-mode-map (kbd "C-M-o") 'dired-omit-mode)
  ;; Hides `dired-tree-up'
  (define-key dired-mode-map (kbd "C-M-u") 'th-dired-up-directory)
  (define-key dired-mode-map (kbd "RET") 'th-dired-find-file))

(use-package dired-x
  :config
  ;; Omit dotfiles when in `dired-omit-mode'.  Use C-M-o to toggle
  ;; `dired-omit-mode'
  (setq dired-omit-files "^\\..*")
  (define-key dired-mode-map (kbd "C-M-o") 'dired-omit-mode))

(use-package dockerfile-mode
  :ensure t)

(use-package ediff
  :config
  (setq ediff-split-window-function 'split-window-horizontally
        ediff-window-setup-function 'ediff-setup-windows-plain
        ediff-keep-variants nil))

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (string= system-type "darwin")
    (exec-path-from-shell-initialize)))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package find-dired
  :ensure t
  :config
  (setq find-ls-option '("-print0 | xargs -0 ls -ld" . "-ld")))

(use-package go-eldoc
  :ensure t
  :config
  (go-eldoc-setup))

(use-package go-guru
  :ensure t)

(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")

  (defun bwb-go-end-of-line-newline-and-indent ()
    (interactive)
    (end-of-line)
    (newline-and-indent))

  (defun bwb-go-insert-expanded-braces ()
    (interactive)
    (end-of-line)
    (insert " {}")
    (backward-char)
    (newline-and-indent))

  (defun bwb-go-insert-colon-equals ()
    (interactive)
    (insert " := ")
    (indent-according-to-mode))

  (defun bwb-go-insert-channel-operator ()
    (interactive)
    (insert " <- ")
    (indent-according-to-mode))

  (define-key go-mode-map (kbd "M-.") 'godef-jump)
  (define-key go-mode-map (kbd "C-c C-r") 'go-remove-unused-imports)
  (define-key go-mode-map (kbd "C-<return>") 'bwb-go-end-of-line-newline-and-indent)
  (define-key go-mode-map (kbd "C-S-<return>") 'bwb-go-insert-expanded-braces)
  (define-key go-mode-map (kbd "C-'") 'bwb-go-insert-colon-equals)
  (define-key go-mode-map (kbd "C-,") 'bwb-go-insert-channel-operator)
  (define-key go-mode-map (kbd "C-<") 'bwb-go-insert-channel-operator)

  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package go-rename
  :ensure t)

(use-package go-snippets
  :ensure t)

(use-package graphviz-dot-mode
  :ensure t)

;;; TODO try helm (and helm-powered versions of imenu, occur,
;;; find-files, and (Projectile's?) browse-project).

(use-package hl-line
  :ensure t)

(use-package ibuffer
  :config
  (global-set-key (kbd "C-x C-b") 'ibuffer))

(use-package ido
  :ensure t
  :config
  (setq ido-enable-flex-matching t
        ido-everywhere t
        ido-use-filename-at-point 'guess
        ido-create-new-buffer 'always
        ido-max-directory-size 100000
        ido-use-virtual-buffers t
        ido-save-directory-list-file (concat user-emacs-directory ".ido.last"))
  (ido-mode t))

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode t))

(use-package imenu
  :config
  (global-set-key (kbd "C-x C-i") 'imenu)
  ;; Don't `insert-file' accidentally.
  (global-set-key (kbd "C-x i") 'imenu))

(use-package ispell
  :config
  (setq ispell-personal-dictionary (concat user-emacs-directory "ispell.dict")))

(use-package json-mode
  :ensure t
  :config
  (setq js-indent-level 2
        json-reformat:indent-width 2))

(use-package js2-mode
  :ensure t
  :config
  (setq js-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;; Use keyfreq data to periodically review the most frequently used
;; commands. Optimize, change habits, or search for alternatives when
;; appropriate.
(use-package keyfreq
  :ensure t
  :config
  (setq keyfreq-file (concat user-emacs-directory ".keyfreq")
        keyfreq-file-lock (concat keyfreq-file ".lock"))
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(use-package kotlin-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :config
  (set-face-attribute 'markdown-code-face nil :family "Source Code Pro"))

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "<f10>") 'magit-status)
  (setq magit-log-arguments '("--graph" "--decorate" "++header" "-n256")
        magit-merge-arguments '("--ff-only")))

(use-package multi-term
  :ensure t
  :config
  (setq multi-term-program "/usr/local/bin/bash"
        multi-term-program-switches "--login")

  (defun bwb-term-mode ()
    (define-key term-raw-map (kbd "C-y") 'term-paste)
    (setq term-buffer-maximum-size 10000))
  (add-hook 'term-mode-hook 'bwb-term-mode)

  (defun fix-coding-system ()
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
  (add-hook 'term-exec-hook 'fix-coding-system)

  (setq term-unbind-key-list '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>"))
  ;; TODO check for broken bindings. Learn more about readline, ~/.inputrc
  ;; Rebind word kill commands. Otherwise WYSI*NOT*WYG!
  (setq term-bind-key-alist '(("C-c C-c" . term-interrupt-subjob)
                              ;; Command line movement
                              ("M-f" . term-send-forward-word)       ; forward-word
                              ("M-b" . term-send-backward-word)      ; backward-word
                              ;; Command line editing
                              ("M-d" . term-send-forward-kill-word)  ; forward-kill-word
                              ("M-M" . term-send-forward-kill-word)  ; forward-kill-word
                              ("M-DEL" . term-send-raw-meta)         ; backward-kill-word
                              ("M-N" . term-send-backward-kill-word) ; unix-word-rubout?!
                              ;; History movement
                              ("M-p" . term-send-up)
                              ("M-n" . term-send-down)
                              ("M-r" . term-send-reverse-search-history)
                              ("M-." . term-send-raw-meta)
                              ;; Buffer movement
                              ("C-p" . previous-line)
                              ("C-n" . next-line)
                              ("C-s" . isearch-forward-regexp)
                              ("C-r" . isearch-backward-regexp)
                              ;; Misc
                              ("C-m" . term-send-raw)
                              ("M-," . term-send-input)))
  (global-set-key (kbd "C-x t") 'multi-term-next)
  (global-set-key (kbd "C-x T") 'multi-term))

(use-package nxml-mode
  :config
  (add-to-list 'rng-schema-locating-files
               (concat (getenv "HOME") "/.nxml/schemas.xml")))

(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode))

(use-package paredit-everywhere
  :ensure t)

(use-package paren
  :config
  (setq blink-matching-paren nil
        show-paren-delay 0
        show-paren-style 'mixed)
  (show-paren-mode t))

(use-package popwin
  :ensure t
  :config
  (popwin-mode 1))

(use-package prog-mode
  :config
  (defun bwb-prog-reformat-buffer ()
    (interactive)
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max)))
  (define-key prog-mode-map (kbd "C-M-o") 'bwb-prog-reformat-buffer)

  (defun bwb-prog-earmuff-symbol ()
    "Insert earmuffs at `point' or wrap `symbol-at-point' with earmuffs.
SYMBOL becomes *SYMBOL*, with point after the right *. Otherwise
** is inserted, with point in the middle."
    (interactive)
    (if (symbol-at-point)
        (progn
          (beginning-of-thing 'symbol)
          (insert "*")
          (forward-thing 'symbol)
          (insert "*"))))
  (define-key prog-mode-map (kbd "C-c *") 'bwb-prog-earmuff-symbol)

  (defun bwb-prog-conf ()
    (eldoc-mode)
    (electric-pair-mode)
    (hl-line-mode)
    (rainbow-delimiters-mode))
  (add-hook 'prog-mode-hook 'bwb-prog-conf))

;;; TODO try Projectile.

(use-package rainbow-delimiters
  :ensure t)

(use-package recentf
  :config
  (setq recentf-save-file (concat user-emacs-directory ".recentf")))

(use-package rich-minority
  :ensure t
  :config
  (rich-minority-mode 1)
  (setq rm-blacklist
        '(" $"
          " =>"
          " Anzu"
          " company"
          " ElDoc"
          " MRev"
          " Par-"
          " Paredit"
          " WS"
          " yas")))

(use-package saveplace
  :config
  (setq save-place-file (concat user-emacs-directory ".saved-places")
        save-place t))

(use-package simple
  :config
  (setq column-number-mode t))

(use-package smex
  :ensure t
  :config
  (smex-initialize)
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  ;; Complete commands smexily.
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "C-x C-m") 'smex)
  (global-set-key (kbd "C-c C-m") 'smex)
  ;; Show "commands that are relevant to the active major mode".
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; Here's the old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  ;; Don't accidentally `compose-mail'.
  (global-set-key (kbd "C-x m") 'smex))

(use-package sublime-themes
  :ensure t
  :config
  ;; Emacs 27.1 changed theme-activation
  (setq custom--inhibit-theme-enable nil)
  ;; mccarthy hl-line-mode may require (set-face-attribute hl-line-face nil :underline nil)
  (load-theme 'granger t)
  (custom-theme-set-faces
   'granger
   ;; http://colorbrewer2.org is a good source of color schemes
   ;; this will do for now
   `(default                          ((t (:foreground "#f7f7f7" :background ,"#000000"))))
   ;; greys
   `(font-lock-constant-face          ((t (:foreground "#f7f7f7"))))
   `(font-lock-string-face            ((t (:foreground "#d9d9d9"))))
   `(font-lock-comment-face           ((t (:foreground "#969696"))))
   `(font-lock-comment-delimiter-face ((t (:foreground "#969696"))))
   `(font-lock-doc-string-face        ((t (:foreground "#969696"))))
   ;; blues
   `(font-lock-variable-name-face     ((t (:foreground "#eff3ff"))))
   `(font-lock-keyword-face           ((t (:foreground "#9ecae1"))))
   `(font-lock-function-name-face     ((t (:foreground "#6baed6"))))
   `(font-lock-type-face              ((t (:foreground "#3182bd"))))
   `(font-lock-builtin-face           ((t (:foreground "#08519c")))))
  (with-eval-after-load 'hl-line
    (set-face-background hl-line-face "grey10")))

(use-package tramp-cache
  :config
  (setq tramp-persistency-file-name (concat user-emacs-directory ".tramp")))

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward))

(use-package vc-hooks
  :config
  (setq vc-handled-backends nil))

(use-package web-mode
  :ensure t
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package whitespace
  :config
  (setq whitespace-style '(face trailing space-before-tab space-after-tab tabs))
  (setq whitespace-global-modes
        '(not calendar-mode
              dired-mode
              go-mode
              inferior-python-mode
              markdown-mode
              term-mode))
  (global-whitespace-mode))

(use-package writegood-mode
  :ensure t
  :config
  (global-set-key (kbd "C-c g") 'writegood-mode))

(use-package yaml-mode
  :ensure t
  :config
  (define-key yaml-mode-map (kbd "RET") 'newline-and-indent))

(use-package yasnippet
  :ensure t
  :config
  (defun bwb-yasnippet-disable ()
    (yas-minor-mode -1))
  (add-hook 'term-mode-hook 'bwb-yasnippet-disable)
  (yas-global-mode))

;;; Conditional Configuration

(defun bwb-init-linux ()
  "Tune Emacs for Linux."
  (setq browse-url-generic-program (getenv "BROWSER")))

(defun bwb-init-macos ()
  "Tune Emacs for macOS."
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (set-frame-font "Source Code Pro 12")
  (setq mac-command-modifier 'meta
        browse-url-generic-program "open"
        ispell-program-name "aspell"
        ring-bell-function 'ignore))

(cond
 ((string= "linux" system-type)
  (bwb-init-linux))
 ((string= "darwin" system-type)
  (bwb-init-macos))
 (t
  (message "no `system-type' specific settings found")))

;; Here's a template for `system-name' specific configuration.
;; (cond
;;  ((string= system-name "HOSTA")
;;   (bwb-init-HOSTB))
;;  ((string= system-name "HOSTB")
;;   (bwb-init-HOSTB))
;;  (t
;;   (message "no `system-name' specific settings found")))

;;; `~/emacs/backup'
;;;
;;; http://www.emacswiki.org/emacs/BackupDirectory
;;; http://www.emacswiki.org/emacs/AutoSave
;;;
;;; Store Emacs' backup and auto-save files in a single
;;; directory. Otherwise you'll someday find yourself running "find
;;; mumble mumble -delete".  You should probably "chmod go=" this
;;; directory.

(setq bwb-backup-directory (concat user-emacs-directory "backup")
      backup-directory-alist `((".*" . ,bwb-backup-directory))
      auto-save-file-name-transforms `((".*" ,bwb-backup-directory t)))

;; Disable backups when using tramp to avoid leaking secrets.
(add-to-list 'backup-directory-alist
             '(tramp-file-name-regexp . nil) t)

;;; Set variables defined in "startup.el", "files.el", and in C source
;;; code.

(setq enable-recursive-minibuffers t
      inhibit-startup-screen t
      require-final-newline "ask")

;;; Set buffer-local defaults.

(setq-default indent-tabs-mode nil
              indicate-empty-lines t
              imenu-auto-rescan t)

;;; Set character encoding.

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;;; Bind search functions.
;;;
;;; Many sources suggest swapping the bindings for normal and regex
;;; search.

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-C-s") 'isearch-forward)
(global-set-key (kbd "M-C-r") 'isearch-backward)

;;; Define aliases.

(defalias 'auto-tail-revert-mode 'tail-mode)
(defalias 'yes-or-no-p 'y-or-n-p)

;;; Start processes.

(multi-term)
(server-start)
