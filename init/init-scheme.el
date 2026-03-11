;; -*- lexical-binding: t; -*-
(use-package geiser
  :ensure t)

(use-package geiser-guile
  :ensure t
  :after (geiser yasnippet)
  :config
  (add-to-list 'geiser-guile-load-path "~/Source/guix")
  (add-to-list 'yas-snippet-dirs "~/Source/guix/etc/snippets/yas"))

(provide 'init-scheme)
