(use-package php-mode
  :ensure t
  :defer t
  :bind ("C--" . cmack/php-quick-arrow)
  :init
  (use-package php-extras :ensure t)
  (use-package s :ensure t)

  (defun cmack/php-quick-arrow ()
    "Inserts -> at point"
    (interactive)
    (insert "->"))

  :config
  (progn
    (setq php-executable "/usr/bin/php")
    (setq php-mode-coding-style 'psr2)
    ;; (php-enable-psr2-coding-style)
    (flycheck-mode 1)

    (setq tab-width 4
          fill-column 119
          indent-tabs-mode nil)
    (turn-on-auto-fill)
    ;; (c-set-offset 'case-label 4)
    (subword-mode 1)

    (setq projectile-tags-command
          (s-join " "
                  (list "ctags -Re"
                        "--languages=-javascript,sql"
                        "--exclude=.git"
                        "--PHP-kinds=+cf"
                        (shell-quote-argument "--regex-PHP='/abstract\s+class\s+([^ ]*)/\\1/c/'")
                        (shell-quote-argument "--regex-PHP='/interface\s+([^ ]*)/\\1/c/'")
                        (shell-quote-argument "--regex-PHP='/(public\s+|static\s+|abstract\s+|protected\s+|private\s+)+function\s+([^ (]*)/\2/f/'"))
                  ))
    ))

(provide 'init-php)
