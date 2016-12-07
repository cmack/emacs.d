(use-package sqlup-mode
  :ensure t
  :commands sqlup-mode)

(use-package sql-indent
  :ensure t
  :after (sql-mode sql-interactive-mode)
  :commands (sql-indent-buffer sql-indent-line)
  :config
  (setq sql-indent-offset 2))

(use-package sql
  :commands sql-mode
  :config
  (add-hook 'sql-mode-hook #'sqlup-mode)
  (setq sql-pop-to-buffer-after-send-region t))

(use-package sql-interactive-mode
  :commands sql-interactive-mode
  :config
  (add-hook 'sql-interactive-mode-hook #'sqlup-mode)
  (toggle-truncate-lines t)
  ;; Handle databases that have snakecase names
  (setq sql-prompt-regexp "[_[:alpha:]]*=?[#>] "
        sql-prompt-cont-regexp "[_[:alpha:]]*-?[#>] "))

(provide 'init-sql)
