(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status))
  :config
  (setq magit-save-some-buffers nil
        magit-last-seen-setup-instructions "1.4.0"))

(provide 'init-git)
