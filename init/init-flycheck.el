(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :after (projectile)
  :init (add-hook 'prog-mode-hook #'flycheck-mode)
  :config

  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))

  (flycheck-add-mode 'javascript-eslint 'web-mode)

  (defun cmack/add-projectile-root-to-eslint ()
    (make-variable-buffer-local 'flycheck-eslint-rules-directories)
    (when (projectile-project-p)
      (add-to-list 'flycheck-eslint-rules-directories (projectile-project-root))))

  (add-hook 'global-flycheck-mode-hook #'cmack/add-projectile-root-to-eslint)
  (add-hook 'flycheck-mode-hook #'cmack/add-projectile-root-to-eslint))

(provide 'init-flycheck)
