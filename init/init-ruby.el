(use-package robe
  :ensure t
  :commands robe-mode
  :config
  (add-to-list 'company-backends 'company-robe))

(use-package ruby-mode
  :ensure t
  :commands ruby-mode
  :config
  (defun cmack/ruby-mode-hook ()
    (robe-mode)
    (eldoc-mode))

  (add-hook 'ruby-mode-hook #'cmack/ruby-mode-hook))

(provide 'init-ruby)
