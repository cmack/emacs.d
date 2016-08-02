(use-package ag :ensure t :defer t)

(use-package helm-projectile
  :ensure t
  :commands helm-projectile-on)

(use-package projectile
  :ensure t
  :commands projectile-global-mode
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (projectile-global-mode)
  (helm-projectile-on)
  (setq projectile-completion-system 'helm))

(provide 'init-projectile)
