(require-package 'php-extras)
;; (require 'mmm-auto)
;; (setq mmm-global-mode 'maybe)
;; (mmm-add-group 'fancy-html
;;                '((html-php-tagged :submode php-mode
;;                                   :face mmm-code-submode-face
;;                                   :front "<\\?\\(php=?\\)?"
;;                                   :back "\\?>"
;;                                  :include-front t
;;                                   :include-back t
;;                                   :insert ((?p php-section nil @ "<?php" @ " " _ " " @ "?>" @)
;;                                            (?b php-block nil @ "<?php" @ "\n" _ "\n" @ "?>" @)))))

;; (mmm-add-mode-ext-class 'html-mode "\\.php[34]?\\'" 'fancy-html)
;; (add-to-list 'auto-mode-alist '("\\.php[34]?\\'" . html-mode))


;; (add-hook 'php-mode-hook 'flymake-php-load)

(setq php-executable "/usr/bin/php")

(add-hook 'php-mode-hook 'my-laravel-coding-style 'append)

(defun my-laravel-coding-style ()
  "Makes php-mode use coding styles that are preferable for working
with Laravel."
  (interactive)
  (flycheck-mode 1)
  (php-enable-psr2-coding-style)
  (setq tab-width 4
        fill-column 119
        show-trailing-whitespace t
        indent-tabs-mode nil)
  (turn-on-auto-fill)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (c-set-offset 'case-label 4)
  (subword-mode 1)
  (projectile-mode 1)
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
  )

(provide 'init-php)
