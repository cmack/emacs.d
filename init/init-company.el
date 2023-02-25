(use-package company
  :ensure t
  :disabled t
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
  :custom
  (company-auto-commit nil)
  (company-idle-delay 0.3)
  (company-show-numbers t)
  (company-tooltip-align-annotations t)
  (company-selection-wrap-around t))

(use-package company-lsp
  :after (lsp-mode company)
  :config
  (cl-pushnew 'company-lsp company-backends))

(use-package corfu
  :ensure t
  :hook ((prog-mode . corfu-mode))
  :bind (:map corfu-map
              ("SPC" . corfu-next)
              ("S-SPC" . corfu-previous))
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-quit-at-boundary nil))

(provide 'init-company)
