;;;; Configure `yasnippet'.

(require 'yasnippet)

(yas/initialize)
(setq yas/root-directory '("~/emacs/snippets"
                           "~/emacs/vendor/yasnippet/snippets"))
(mapc 'yas/load-directory yas/root-directory)

(provide 'bwb-yasnippet)
