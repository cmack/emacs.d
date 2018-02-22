(use-package yasnippet
  :ensure t
  :commands yas-global-mode
  :hook ((html-mode . (lambda ()
                        (setq ac-sources
                              '(ac-source-semantic ac-source-yasnippet))))
         (after-init . yas-global-mode)))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(provide 'init-yasnippet)
