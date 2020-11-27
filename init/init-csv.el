;;; init-csv
;;; Code:
(defun cmack/csv-mode-hook ()
  "My custom csv mode hook.
These don't work in :config of (use-package csv-mode )."
  (csv-align-mode 1)
  (csv-header-line))

(use-package csv-mode
  :ensure t
  :mode ("\\.tsv$" "\\.csv$" "\\.tabular$" "\\.vcf$")
  :config
  (toggle-truncate-lines 1)
  :hook (csv-mode . cmack/csv-mode-hook))

(provide 'init-csv)
