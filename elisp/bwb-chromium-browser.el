;;; Run an edit server for the Chromium browser.
(require 'edit-server)

(setq edit-server-new-frame nil)
(edit-server-start)

(provide 'bwb-chromium-browser)
