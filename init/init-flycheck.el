(use-package flycheck
  :ensure t
  :defer 5
  :config
  (global-flycheck-mode 1)
  :diminish flycheck-mode)

(provide 'init-flycheck)
