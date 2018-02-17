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
  :mode ("\\.php\\'" "\\.inc\\'" "\\.module\\'")
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
    ;; (let ((array-keys-font-lock
    ;;        (rx-to-string '(and (group (any "\"" "'")
    ;;                                   (one-or-more (and (not (any space ";")))))
    ;;                            (one-or-more space)
    ;;                            "=>"
    ;;                            (one-or-more space))))

    ;;       (arrow-function-font-lock
    ;;        (rx-to-string '(and "->" (group (one-or-more word)) "(")))

    ;;       (psr2-type-hint-multiline-font-lock
    ;;        (rx-to-string '(and (or "public" "private" "protected" "static")
    ;;                            (one-or-more space) "function"
    ;;                            (one-or-more space)
    ;;                            (one-or-more (not (any ":" "{")))
    ;;                            ":"
    ;;                            (opt (one-or-more space))
    ;;                            (group (one-or-more word))
    ;;                            (opt (one-or-more space))
    ;;                            "{"))))
    ;;  (font-lock-add-keywords
    ;;   'php-mode
    ;;   (list (list array-keys-font-lock 1 'font-lock-variable-name-face t)
    ;;         (list arrow-function-font-lock 1 'font-lock-function-name-face )
    ;;         ;; (list psr2-type-hint-multiline-font-lock 1 'font-lock-type-face)
    ;;         )))
    (lsp-mode t))

  ;; (setq php-executable "/usr/bin/php")
  (setq php-mode-coding-style 'psr2)
  (setq tab-width 4
        fill-column 119
        indent-tabs-mode nil)

  (add-hook 'php-mode-hook #'cmack/php-mode-hook))

;; (use-package lsp-php
;;   :ensure t
;;   :after (php-mode lsp-mode)
;;   :config
;;   (lsp-php-enable)
;;   :custom
;;   (lsp-php-server-install-dir (expand-file-name "~/.composer/")))

(use-package lsp-php
  :after (php-mode lsp-mode)
  :load-path "~/Source/lsp-php"
  :pin manual
  :hook ((php-mode . lsp-php-enable))
  :custom
  (lsp-php-language-server-command
   (list "php"
         (expand-file-name "~/.composer/vendor/bin/php-language-server.php"))))


(provide 'init-php)
