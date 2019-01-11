(use-package terraform-mode
  :ensure t
  :defer t
  :mode ".\\tf\\'")

(use-package company-terraform
  :ensure t
  :after terraform-mode
  :config (company-terraform-init))

(provide 'init-terraform)
