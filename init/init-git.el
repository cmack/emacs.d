(use-package magit
  :ensure t
  :defer t
  :config
  (setq magit-save-some-buffers nil
        magit-last-seen-setup-instructions "1.4.0"))

(provide 'init-git)
