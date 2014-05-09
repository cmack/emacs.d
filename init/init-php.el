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

(c-add-style
 "laravel"
 '((c-basic-offset . 4)
   (c-offsets-alist . ((arglist-intro . '+)
                       (arglist-close . 0)
                       (inline-open . 0)
                       (substatement-open . 0)
                       (block-open . 0)))))

(defun my-laravel-coding-style ()
  "Makes php-mode use coding styles that are preferable for working
with Laravel."
  (interactive)
  ;; (flymake-mode 1)
  (php-enable-pear-coding-style)
  (setq tab-width 4
        fill-column 119
        show-trailing-whitespace t
        indent-tabs-mode nil)
  (turn-on-auto-fill)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (c-set-offset 'case-label 4)
  ;; (c-set-style "laravel")
  )

(provide 'init-php)
