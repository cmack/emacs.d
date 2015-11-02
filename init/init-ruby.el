(use-package ruby-mode
  :ensure t
  :defer t
  :config
  (use-package robe
    :ensure t
    :commands robe-mode)
  (robe-mode)
  (eldoc-mode))

(provide 'init-ruby)
