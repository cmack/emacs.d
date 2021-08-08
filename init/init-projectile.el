(use-package ag :ensure t :defer t)

(use-package ripgrep :ensure t :defer t)

(use-package helm-projectile
  :ensure t
  :after (projectile helm)
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(use-package projectile
  :ensure t
  :commands projectile-mode
  :hook (after-init . projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map))

(provide 'init-projectile)
