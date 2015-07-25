(use-package octave-mode
  :defer t
  :ensure t
  :mode ("\\.m$")
  :config
  (progn (setq inferior-octave-program "~/bin/octave")
         (abbrev-mode 1)
         (auto-fill-mode 1)
         (if (eq window-system 'x) (font-lock-mode 1))
         ))
