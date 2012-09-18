(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

(smex-initialize)
(global-set-key "\M-x" 'smex)

(provide 'init-ido)
