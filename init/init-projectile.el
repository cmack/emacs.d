(use-package ag :ensure t :defer t)

(use-package ripgrep :ensure t :defer t)

(use-package helm-projectile
  :ensure t
  :after (projectile helm)
  :config
  (helm-projectile-on))

(use-package projectile
  :ensure t
  :commands projectile-mode
  :hook ( prog-mode . projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (setq projectile-completion-system 'helm))

(provide 'init-projectile)
