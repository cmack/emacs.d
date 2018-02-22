(use-package json-mode
  :defer t
  :ensure t)

(use-package js2-mode
  :ensure t
  :defer t
  :mode "\\.js$"
  :config
  (use-package js2-refactor
    :ensure t
    :commands js2-refactor-mode
    :config
    (js2r-add-keybindings-with-prefix "C-c C-r"))

  (electric-indent-mode -1)
  (setq js2-basic-offset 2)
  (setq js2-bounce-indent-p t)
  (setq js2-consistent-level-indent-inner-bracket-p t)
  (setq js2-pretty-multiline-decl-indentation-p t)
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (tern-mode 1))

(use-package tern
  :ensure t
  :commands tern-mode)

(use-package company-tern
  :ensure t
  :after tern
  :config
  (add-to-list 'company-backends 'tern-company))

(use-package nodejs-repl
  :ensure t
  :after js2-mode
  :bind (("C-x C-e" . nodejs-repl-send-last-sexp)
         ("C-c C-r" . nodejs-repl-send-region)
         ("C-c C-l" . nodejs-repl-load-file)
         ("C-c C-z" . nodejs-repl-switch-to-repl)))

(use-package coffee-mode
  :ensure t
  :defer t
  :mode "\\.em$"
  :config
  (progn
    (setq tab-width 2)
    (setq coffee-tab-width 2)
    (setq indent-tabs-mode t)
    (add-hook 'before-save-hook
              (lambda ()
                ;; This is a sad hack. coffee-mode indents strictly
                ;; by spaces and I don't have time to patch.
                ;; I need tabs for work standards.
                (tabify-buffer))
              nil t)
    ))

;; (use-package skewer-mode
;;   :ensure t
;;   :after js2-mode)

(provide 'init-javascript)
