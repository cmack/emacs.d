(use-package helm-ag
  :ensure t
  :after (helm helm-projectile)
  :config
  ;; ripgrep command:
  (setf helm-grep-ag-command
        "rg --smart-case --no-heading --line-number %s %s %s"))

(use-package helm-config
  :after helm)

(use-package helm
  :ensure t
  :diminish helm-mode
  :bind
  (("C-c h" . helm-mini)
   ("C-h a" . helm-apropos)
   ("C-x b" . helm-buffers-list)
   ("C-x C-b" . helm-buffers-list)
   ("C-x C-f" . helm-find-files)
   ("C-x c o" . helm-occur)
   ;; ("C-x c s" . helm-swoop)
   ;; ("C-x c y" . helm-yas-complete)
   ;; ("C-x c Y" . helm-yas-create-snippet-on-region)
   ("C-x c SPC" . helm-all-mark-rings)
   ("M-y" . helm-show-kill-ring)
   ("M-x" . helm-M-x))
  :config
  (setq helm-candidate-number-limit 100)
  ;; From https://gist.github.com/antifuchs/9238468
  (setq helm-idle-delay 0.0    ; update fast sources immediately (doesn't).
        helm-input-idle-delay 0.01   ; this actually updates things
                                        ; reeeelatively quickly.
        helm-yas-display-key-on-candidate t
        helm-quick-update t
        helm-M-x-requires-pattern nil
        helm-ff-skip-boring-files t)
  :hook (after-init . helm-mode))

(use-package helm-adaptive
  :hook (helm-mode . helm-adaptive-mode))

(use-package helm-descbinds
  :ensure t
  :after helm
  :bind (("C-h b" . helm-descbinds)
         ("C-h w" . helm-descbinds)))

(use-package helm-gtags
  :ensure t
  :after helm
  :commands helm-gtags-mode
  :bind (("M-." . helm-gtags-dwim)
         ("M-," . helm-gtags-pop-stack)
         ("M-r" . helm-gtags-find-rtag))

  :config
  (setq helm-gtags-auto-update t))

(provide 'init-helm)
