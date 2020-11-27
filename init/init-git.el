(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)
   ("C-c g" . magit-file-dispatch))

  :config
  (setq-default magit-diff-refine-hunk t))


(provide 'init-git)
