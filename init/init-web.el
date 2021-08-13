(use-package haml-mode :ensure t :defer t)

(use-package restclient :ensure t :defer t)

(use-package scss-mode
  :ensure t
  :mode "\\.scss\\'"
  :config
  (setq scss-compile-at-save nil))

(use-package sass-mode
  :disabled t
  :ensure t
  :mode "\\.scss\\'")

(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'")

(use-package yaml-mode
  :ensure t
  :mode "\\.yaml\\'")

(use-package emmet-mode
  :ensure t
  :commands emmet-mode
  :hook
  (web-mode html-mode))

(use-package web-mode
  :ensure t
  :commands web-mode
  :mode ("\\.hbs\\'"
         "\\.jsx\\'"
         "\\.vue\\'"
         "/\\([Vv]iews\\|[Hh]tml\\|[Tt]emplates\\)/.*\\.php\\'"
         "\\.blade\\.php\\'")
  :config
  (setq sgml-basic-offset 2)
  (setq web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-markup-indent-offset 2
        web-mode-attr-indent-offset 2
        web-mode-enable-current-element-highlight t)

  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))

  (setq web-mode-ac-sources-list
        '(("php" . (ac-source-yasnippet))
          ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
          ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))

  (setq web-mode-content-types-alist
        '(("jsx" . "/\\(container\\|component\\)[s]?/.*\\.js[x]?\\'")))

  :init
  (add-hook 'web-mode-before-auto-complete-hooks
            #'(lambda ()
               (let ((web-mode-cur-language (web-mode-language-at-pos)))
                 (if (string= web-mode-cur-language "php")
                     (yas-activate-extra-mode 'php-mode)
                   (yas-deactivate-extra-mode 'php-mode))
                 (if (string= web-mode-cur-language "javascript")
                     (yas-activate-extra-mode 'js2-mode)
                   (yas-deactivate-extra-mode 'js2-mode))
                 (if (string= web-mode-cur-language "css")
                     (setq emmet-use-css-transform t)
                   (setq emmet-use-css-transform nil)))))
  :hook ((web-mode . subword-mode)
         (web-mode . emmet-mode)
         (before-save . delete-trailing-whitespace)
         html-mode))

(use-package tagedit
  :ensure t
  :commands tagedit-mode
  :config
  (tagedit-add-paredit-like-keybindings)
  ;; (add-hook 'web-mode-hook 'tagedit-mode)
  :hook
  (((sgml-mode html-mode) . tagedit-mode)))

(provide 'init-web)
