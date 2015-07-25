(use-package ruby-mode
  :ensure t
  :defer t
  :init (use-package robe :ensure t)
  :config (progn
             (robe-mode)
             (eldoc-mode)
             (add-hook 'before-save-hook 'whitespace-cleanup)))

(provide 'init-ruby)
