(use-package ag :ensure t :defer t)

(use-package ripgrep :ensure t :defer t)

(use-package helm-projectile
  :ensure t
  :commands helm-projectile-on)

(use-package projectile
  :ensure t
  :commands projectile-mode
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  (add-hook 'prog-mode-hook #'projectile-mode)
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm))

(use-package projectile-ripgrep
  :after projectile
  :bind (:map projectile-command-map ("s r" . projectile-ripgrep)))

(provide 'init-projectile)
