(use-package sqlup-mode
  :ensure t
  :commands sqlup-mode
  :hook (sql-mode sql-interactive-mode))

(use-package sql-indent
  :ensure t
  :after (:any sql sql-interactive-mode)
  :config
  (setq sql-indent-offset 2))

(use-package sql
  :commands sql-mode
  :config
  (setq sql-pop-to-buffer-after-send-region t))

(use-package sql-interactive-mode
  :commands sql-interactive-mode
  :config
  (toggle-truncate-lines t)
  ;; Handle databases that have snakecase names
  (setq sql-prompt-regexp "[_[:alpha:]]*=?[#>] "
        sql-prompt-cont-regexp "[_[:alpha:]]*-?[#>] "))

(provide 'init-sql)
