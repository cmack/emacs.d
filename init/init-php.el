(use-package ggtags
  :ensure t
  :commands ggtags-mode
  :diminish ggtags-mode)


(use-package php-mode
  :ensure t
  :defer t
  :bind ("C--" . cmack/php-quick-arrow)
  :init
  (use-package php-extras :defer t)
  (use-package s :ensure t)

  (defun cmack/php-quick-arrow ()
    "Inserts -> at point"
    (interactive)
    (insert "->"))

  :preface
  (defun cmack/php-mode-hook ()
    (emmet-mode 1)
    (flycheck-mode 1)
    (ggtags-mode 1)
    (turn-on-auto-fill)
    (electric-indent-mode)
    (electric-pair-mode)
    (electric-layout-mode))

  :config
  (setq php-executable "/usr/bin/php")
  (setq php-mode-coding-style 'psr2)
  (setq tab-width 4
        fill-column 119
        indent-tabs-mode nil)
  (add-hook 'php-mode-hook #'cmack/php-mode-hook)
  ;; (setq projectile-tags-command
  ;;       (s-join " "
  ;;               (list "ctags -Re"
  ;;                     "--languages=-javascript,sql"
  ;;                     "--exclude=.git"
  ;;                     "--PHP-kinds=+cf"
  ;;                     (shell-quote-argument "--regex-PHP='/abstract\s+class\s+([^ ]*)/\\1/c/'")
  ;;                     (shell-quote-argument "--regex-PHP='/interface\s+([^ ]*)/\\1/c/'")
  ;;                     (shell-quote-argument "--regex-PHP='/(public\s+|static\s+|abstract\s+|protected\s+|private\s+)+function\s+([^ (]*)/\2/f/'"))
  ;;               ))
  )

(provide 'init-php)
