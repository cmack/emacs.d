(use-package company
  :ensure t
  :commands company-mode
  :config
  (setq company-auto-complete t)
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

(provide 'init-company)
