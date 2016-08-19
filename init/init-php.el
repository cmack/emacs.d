(use-package ggtags
  :ensure t
  :commands ggtags-mode
  :diminish ggtags-mode
  :config
  (setq ggtags-completing-read-function nil))

(use-package php-extras
  :ensure t
  :commands php-mode)

(use-package phpcbf
  :ensure t
  :commands php-mode
  :config
  (setq phpcbf-standard "PSR2"))

(use-package phpunit
  :ensure t
  :commands php-mode)

(use-package php-mode
  :ensure t
  :bind ("C--" . cmack/php-quick-arrow)
  :config

  (defun cmack/php-quick-arrow ()
    "Inserts -> at point"
    (interactive)
    (insert "->"))

  (defun cmack/php-mode-hook ()
    (emmet-mode 1)
    (flycheck-mode 1)
    ;; (ggtags-mode 1)
    (helm-gtags-mode 1)
    (company-mode 1)
    (eldoc-mode 1)
    (turn-on-auto-fill)
    (electric-indent-mode)
    (electric-pair-mode)
    (electric-layout-mode)

    (setq flycheck-phpcs-standard "PSR2")

    ;; Experiment with highlighting keys in assoc. arrays
    (font-lock-add-keywords
     'php-mode
     '(("\\s\"\\([^\s;]+\\)\\s\"\\s-+=>\\s-+" 1 'font-lock-variable-name-face t))))

  (setq php-executable "/usr/bin/php")
  (setq php-mode-coding-style 'psr2)
  (setq tab-width 4
        fill-column 119
        indent-tabs-mode nil)

  (add-hook 'php-mode-hook #'cmack/php-mode-hook))

(provide 'init-php)
