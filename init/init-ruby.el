;;; -*- lexical-binding: t -*-

(use-package robe
  :ensure t
  :commands robe-mode
  :after (company-mode)
  :hook ruby-mode
  :config
  (add-to-list 'company-backends 'company-robe))

(use-package ruby-mode
  :mode "\\.rb\\'"
  :commands ruby-mode
  :hook (ruby-mode . eldoc-mode))

(provide 'init-ruby)
