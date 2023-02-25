(use-package company
  :ensure t
  :commands company-mode
  :hook ((prog-mode . company-mode))
  :bind (("C-c C-y" . company-yasnippet)
         :map company-active-map
         ("SPC" . company-select-next)
         ("S-SPC" . company-select-previous)
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ;; ("Enter" . company-complete-selection)
         )
  :config
  (setq company-auto-commit nil
        company-idle-delay 0.3
        company-show-numbers t
        company-tooltip-align-annotations t
        company-selection-wrap-around t))

(use-package company-lsp
  :after (lsp-mode company)
  :config
  (cl-pushnew 'company-lsp company-backends))

(provide 'init-company)
