(use-package helm-config
  :defer 0.1
  :config
  (use-package helm
    :ensure t
    :diminish helm-mode
    :commands helm-mode
    :config
    (use-package helm-descbinds :ensure t)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0    ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01   ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t)
    (helm-mode 1)
    :bind  (("C-c h" . helm-mini)
            ("C-h a" . helm-apropos)
            ("C-h b" . helm-descbinds)
            ("C-h w" . helm-descbinds)
            ("C-x b" . helm-buffers-list)
            ("C-x C-b" . helm-buffers-list)
            ("C-x C-f" . helm-find-files)
            ("C-x c o" . helm-occur)
            ;; ("C-x c s" . helm-swoop)
            ;; ("C-x c y" . helm-yas-complete)
            ;; ("C-x c Y" . helm-yas-create-snippet-on-region)
            ("C-x c SPC" . helm-all-mark-rings)
            ("M-y" . helm-show-kill-ring)
            ("M-x" . helm-M-x))))

(use-package helm-gtags
  :ensure t
  :commands helm-gtags-mode
  :bind (("M-." . helm-gtags-dwim)
         ("M-," . helm-gtags-pop-stack)
         ("M-r" . helm-gtags-find-rtag)))

(provide 'init-helm)
