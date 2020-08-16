(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)
   ;; ("C-c g l" . magit-log-buffer-file)
   :map magit-file-mode-map
   ("C-c g" . magit-file-dispatch))

  :config
  (setq-default magit-diff-refine-hunk t)
  (setq magit-save-some-buffers nil
        magit-last-seen-setup-instructions "1.4.0")
  :hook (after-init . global-magit-file-mode))


(provide 'init-git)
