(use-package projectile
  :ensure t
  :init (use-package helm-projectile :ensure t)
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(provide 'init-projectile)
