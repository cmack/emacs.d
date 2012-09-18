(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook (lambda ()
                           (setq js2-bounce-indent-p t)
                           (setq js2-consistent-level-indent-inner-bracket-p t)
                           (setq js2-pretty-multiline-decl-indentation-p t)))

(provide 'init-javascript)
