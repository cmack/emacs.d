(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook (lambda ()
                           (electric-indent-mode -1)
                           (setq js2-bounce-indent-p t)
                           (setq js2-consistent-level-indent-inner-bracket-p t)
                           (setq js2-pretty-multiline-decl-indentation-p t)))

(defun customize-coffee ()
  "my custom coffee-mode hook"
  ;; (setq (make-local-variable 'tab-width) 2)
  ;; (setq (make-local-variable 'indent-tabs-mode) t)
  (setq tab-width 2)
  (setq coffee-tab-width 2)
  (setq indent-tabs-mode t)
  (setq show-trailing-whitespace t)
  (add-hook 'before-save-hook (lambda ()
                                (delete-trailing-whitespace)
                                ;; This is a sad hack. coffee-mode indents strictly
                                ;; by spaces and I don't have time to patch.
                                ;; I need tabs for work standards.
                                (tabify-buffer))
            nil t))

(autoload 'coffee-mode "coffee-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.em$" . coffee-mode))
(add-hook 'coffee-mode-hook 'customize-coffee)

(provide 'init-javascript)
