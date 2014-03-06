;; (require 'multi-web-mode)

;; (setq mweb-default-major-mode 'html-mode)
;; (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;                   (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;;                   (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;; (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;; (multi-web-global-mode 1)

(require 'web-mode)
(require 'emmet-mode)


(add-to-list 'auto-mode-alist '("/\\([Vv]iews\\|[Hh]tml\\|[Tt]emplates\\)/.*\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode t
                  tab-width 4)
            (add-hook 'before-save-hook 'delete-trailing-whitespace)
            (emmet-mode 1)))

(add-hook 'html-mode-hook
          (lambda ()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode t
                  tab-width 4)
            (add-hook 'before-save-hook 'delete-trailing-whitespace)
            (emmet-mode 1)))

(provide 'init-web)
