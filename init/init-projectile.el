(use-package projectile
  :ensure t
  :commands projectile-global-mode
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (use-package helm-projectile
    :ensure t
    :config
    (setq projectile-completion-system 'helm)
    (helm-projectile-on))
  (projectile-global-mode))

(provide 'init-projectile)
