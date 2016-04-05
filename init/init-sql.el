(use-package sql
  :commands sql-mode
  :config
  (use-package sql-indent
    :ensure t)

  (add-hook 'sql-interactive-mode-hook
            (lambda ()
              (setq sql-prompt-regexp "[_[:alpha:]]*=?[#>] ")
              (setq sql-prompt-cont-regexp "[_[:alpha:]]*-?[#>] "))))




(provide 'init-sql)
