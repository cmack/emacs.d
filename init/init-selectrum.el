;;; init-selectrum.el --- Config for selectrum  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode)
  :custom
  (vertico-count 13)
  (vertico-resize t)
  (vertico-cycle t))

(use-package prescient
  :ensure t
  :after vertico
  :config
  (prescient-persist-mode 1))

(use-package vertico-prescient
  :ensure t
  :after (vertico prescient)
  :config
  (vertico-prescient-mode 1))

(use-package consult
  :ensure t
  :after (vertico)
  :bind (("C-h a" . describe-symbol)
         ("C-s" . consult-line)
         ("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-s-r" . consult-ripgrep)
         ("M-y" . consult-yank-pop)))

(use-package consult-flycheck
  :ensure t
  :after (consult flycheck)
  :bind (:map flycheck-command-map
              ("!" . consult-flycheck)))

(use-package embark-consult
  :ensure t
  :after (consult embark)
  :hook (embark-collect . embark-consult-preview-minor-mode))

(use-package marginalia
  :ensure t
  :config
  (setq-default marginalia-annotators '(marginalia-annotators-heavy))
  :hook (after-init . marginalia-mode))

(use-package embark
  :ensure t
  :after vertico
  :bind (("C-." . embark-act)
         ("C-h b" . embark-bindings)))

(use-package orderless
  :ensure t
  :after vertico
  :custom
  (completion-styles (list 'orderless 'flex)))

(provide 'init-selectrum)
;;; init-selectrum.el ends here
