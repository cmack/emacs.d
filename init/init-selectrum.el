;;; init-selectrum.el --- Config for selectrum  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package selectrum
  :ensure t
  :hook (after-init . selectrum-mode))

(use-package prescient
  :ensure t
  :after selectrum
  :config
  (prescient-persist-mode 1))

(use-package selectrum-prescient
  :ensure t
  :after (selectrum prescient)
  :config
  (selectrum-prescient-mode 1))

(use-package embark
  :ensure t
  :after selectrum)

(use-package consult
  :ensure t
  :after (selectrum projectile)
  :bind  (("C-h a" . consult-apropos)
          ("C-x b" . consult-buffer)
          ("C-x 4 b" . consult-buffer-other-window)
          ("C-x 5 b" . consult-buffer-other-frame)
          ("M-g g" . consult-goto-line)
          ("M-g M-g" . consult-goto-line))
  :config
  (setq-default consult-project-root-function #'projectile-project-root))

(use-package consult-flycheck
  :ensure t
  :after (consult flycheck))

(use-package embark-consult
  :ensure t
  :after (consult embark)
  :hook (embark-collect . embark-consult-preview-minor-mode))

(use-package marginalia
  :ensure t
  :config
  (setq-default marginalia-annotators '(marginalia-annotators-heavy))
  :hook (after-init . marginalia-mode))

(provide 'init-selectrum)
;;; init-selectrum.el ends here
