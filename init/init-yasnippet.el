(use-package yasnippet
  :ensure t
  :commands yas-global-mode
  :init
  (add-hook 'after-init-hook #'yas-global-mode)
  :config
  (setq yas-snippet-dirs (list (expand-file-name
                                (concat user-emacs-directory "snippets"))))
  (add-to-list 'yas-snippet-dirs
               (concat (file-name-directory (locate-library "yasnippet"))
                       "snippets"))

  (add-hook 'html-mode-hook (lambda ()
                              (setq ac-sources '(ac-source-semantic ac-source-yasnippet)))))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(provide 'init-yasnippet)
