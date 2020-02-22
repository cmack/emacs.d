(use-package company
  :ensure t
  :commands company-mode
  :hook ((prog-mode . company-mode))
  :bind (("C-c C-y" . company-yasnippet)
         :map company-active-map
         ("SPC" . company-select-next)
         ("S-SPC" . company-select-previous)
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (setq company-auto-complete t
        company-idle-delay 0.3
        company-show-numbers t
        company-tooltip-align-annotations t))

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config
  (add-to-list 'company-backends 'company-lsp)
  :custom
  (company-lsp-async t)
  (company-lsp-enable-snippet t))

(provide 'init-company)
