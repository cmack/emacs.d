(use-package ido
  :ensure t
  :defer t
  :init
  (progn
    ;; Use C-f during file selection to switch to regular find-file
    (use-package ido-vertical-mode :ensure t)
    (use-package idomenu :ensure t)

    (ido-mode t)
    (ido-everywhere t)

    (ido-vertical-mode 1)

    (when (eval-when-compile (>= emacs-major-version 24))
      (use-package ido-ubiquitous :ensure t)
      (ido-ubiquitous-mode t))
    )
  :config
  (progn
    (setq ido-enable-flex-matching t
          ido-use-filename-at-point nil
          ido-auto-merge-work-directories-length 0
          ido-use-virtual-buffers t)
    ;; Allow the same buffer to be open in different frames
    (setq ido-default-buffer-method 'selected-window)
    ))

;; Use smex to handle M-x
(when (eval-when-compile (>= emacs-major-version 24))
  (use-package smex
    :ensure t
    :config
    (global-set-key [remap execute-extended-command] 'smex)))

(provide 'init-ido)
