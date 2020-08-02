;;; -*- lexical-binding: t -*-

(use-package ggtags
  :ensure t
  :commands ggtags-mode
  :diminish ggtags-mode
  :config
  (setq ggtags-completing-read-function nil))

(use-package smartparens
  :ensure smartparens
  :commands (smartparens turn-on-smartparens-strict-mode)
  :config (sp-use-paredit-bindings))

(use-package smartparens-config
  :after smartparens)

(use-package php-extras
  :ensure t
  :commands php-mode)

(use-package phpcbf
  :ensure t
  :after php-mode
  :config
  (setq phpcbf-standard "PSR2"))

(use-package phpunit
  :ensure t
  :commands php-mode)

;; (use-package company-php
;;   :ensure t
;;   :after php-mode
;;   :config
;;   (add-to-list 'company-backends 'company-ac-php-backend))

(use-package php-mode
  :ensure t
  :mode ("\\.php\\'" "\\.inc\\'" "\\.module\\'")
  :bind (("C--" . cmack/php-quick-arrow)
         :map php-mode-map
         ("C-d" . sp-delete-char))
  :init
  (defun cmack/php-mode-hook ()
    (emmet-mode +1)
    (flycheck-mode +1)
    ;; (ggtags-mode 1)
    ;; (helm-gtags-mode +1)
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
    (let ((array-keys-font-lock
           (rx (group (any "\"" "'")
                      (1+ (not (any ";" whitespace))))
               (1+ (syntax whitespace))
               "=>"
               (1+ (syntax whitespace))))

          (arrow-function-font-lock
           (rx "->" (group (1+ (syntax word))) "("))

          (psr2-type-hint-multiline-font-lock
           (rx (or "public" "private" "protected" "static")
               (1+ (syntax whitespace))
               "function"
               (1+ (syntax whitespace))
               (1+ (not (any ":" "{")))
               ":"
               (opt (1+ (syntax whitespace)))
               (group (1+ (syntax word)))
               (opt (1+ (syntax whitespace)))
               "{")))
     (font-lock-add-keywords
      'php-mode
      (list (list array-keys-font-lock 1 'font-lock-variable-name-face t)
            (list arrow-function-font-lock 1 'font-lock-function-name-face )
            ;; (list psr2-type-hint-multiline-font-lock 1 'font-lock-type-face)
            ))))
  :hook (cmack/php-mode-hook)
  :config
  (defun cmack/php-quick-arrow (arg)
    "Inserts -> at point"
    (interactive "P")
    (insert (if arg "=>" "->")))

  ;; (setq php-executable "/usr/bin/php")
  (setq php-mode-coding-style 'psr2
        php-project-use-projectile-to-detect-root t)
  (setq tab-width 4
        fill-column 119
        indent-tabs-mode nil
        lsp-intelephense-storage-path (expand-file-name "~/.cache/lsp-cache"))


  (add-hook 'php-mode-hook #'cmack/php-mode-hook))

(provide 'init-php)
