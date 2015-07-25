(use-package haml-mode :ensure t :defer t)

(use-package scss-mode
  :ensure t :defer t
  :config
  (setq scss-compile-at-save nil))

(use-package sass-mode :ensure t :defer t)
(use-package markdown-mode :ensure t :defer t)

(use-package web-mode
  :ensure t
  :defer t
  :mode ("\\.hbs\\'"
         "\\.jsx\\'"
         "/\\([Vv]iews\\|[Hh]tml\\|[Tt]emplates\\)/.*\\.php\\'")
  :config
  (progn
    (use-package emmet-mode :ensure t)
    (setq sgml-basic-offset 4)
    (setq indent-tabs-mode t
          tab-width 4
          web-mode-code-indent-offset 2
          web-mode-css-indent-offset 2
          web-mode-markup-indent-offset 4)

    (setq web-mode-ac-sources-list
          '(("php" . (ac-source-yasnippet))
            ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
            ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))
    (subword-mode 1)
    (emmet-mode 1)

    (add-hook 'before-save-hook 'delete-trailing-whitespace)

    (add-hook 'web-mode-before-auto-complete-hooks
              '(lambda ()
                 (let ((web-mode-cur-language (web-mode-language-at-pos)))
                   (if (string= web-mode-cur-language "php")
                       (yas-activate-extra-mode 'php-mode)
                     (yas-deactivate-extra-mode 'php-mode))
                   (if (string= web-mode-cur-language "css")
                       (setq emmet-use-css-transform t)
                     (setq emmet-use-css-transform nil)))))

    (add-hook 'html-mode 'web-mode)))

(use-package sgml-mode
  :defer t
  :config
  (progn
    (use-package tagedit :ensure t)
    (tagedit-add-paredit-like-keybindings)
    (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1)))))

(provide 'init-web)
