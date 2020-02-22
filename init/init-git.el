(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)
   ;; ("C-c g l" . magit-log-buffer-file)
   :map magit-file-mode-map
   ("C-c g" . magit-file-dispatch))

  :config
  (setq magit-save-some-buffers nil
        magit-last-seen-setup-instructions "1.4.0"))

(provide 'init-git)
