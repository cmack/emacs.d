(use-package ggtags
  :ensure t
  :commands ggtags-mode
  :diminish ggtags-mode
  :config
  (setq ggtags-completing-read-function nil))

(use-package smartparens
  :ensure smartparens
  :commands (smartparens turn-on-smartparens-strict-mode)
  :bind (("C-d" . sp-delete-char)
         ("C-M-f" . sp-forward-sexp)
         ("C-M-b" . sp-backward-sexp)
         ("C-M-k" . sp-kill-sexp)
         ("C-M-e" . sp-up-sexp)
         ("C-M-n" . sp-next-sexp)
         ("C-M-p" . sp-previous-sexp)
         ("C-M-s" . sp-unwrap-sexp)
         ("C-M-t" . sp-transpose-sexp)
         ("C-M-<backspace>" . sp-backward-unwrap-sexp)
         ("C-M-w" . sp-copy-sexp)
         ("C-<right>" . sp-slurp-hybrid-sexp)
         ("C-<left>" . sp-forward-barf-sexp)
         ("C-M-<left>" . sp-backward-slurp-sexp)
         ("C-M-<right>" . sp-backward-barf-sexp)
         ("M-F" . sp-forward-symbol)
         ("M-B" . sp-backward-symbol))
  :config
  (use-package smartparens-config))

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

(use-package company-php
  :ensure t
  :after php-mode
  :config
  (add-to-list 'company-backends 'company-ac-php-backend))

(use-package php-mode
  :ensure t
  :bind (("C--" . cmack/php-quick-arrow)
         :map php-mode-map
         ("C-d" . sp-delete-char))
  :config

  (defun cmack/php-quick-arrow (arg)
    "Inserts -> at point"
    (interactive "P")
    (insert (if arg "=>" "->")))

  (defun cmack/php-mode-hook ()
    (emmet-mode +1)
    (flycheck-mode +1)
    ;; (ggtags-mode 1)
    (helm-gtags-mode +1)
    (company-mode +1)
    (eldoc-mode +1)
    (turn-on-auto-fill)
    ;; (electric-indent-mode)
    ;; (electric-pair-mode)
    ;; (electric-layout-mode)
    (smartparens-strict-mode +1)
    (setq flycheck-phpcs-standard "PSR2"
          flycheck-php-executable "/opt/local/bin/php"
          flycheck-php-phpcs-executable "~/.composer/vendor/bin/phpcs"
          flycheck-php-phpmd-executable "~/.composer/vendor/bin/phpmd")

    ;; Experiment with highlighting keys in assoc. arrays
    (font-lock-add-keywords
     'php-mode
     '(("\\s\"\\([^\s;]+\\)\\s\"\\s-+=>\\s-+" 1 'font-lock-variable-name-face t)
       ("->\\(\\w+\\)(" 1 'font-lock-function-name-face ))))

  ;; (setq php-executable "/usr/bin/php")
  (setq php-mode-coding-style 'psr2)
  (setq tab-width 4
        fill-column 119
        indent-tabs-mode nil)

  (add-hook 'php-mode-hook #'cmack/php-mode-hook))

(provide 'init-php)
