(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'prog-mode-hook 'company-mode)))

(provide 'init-company)
