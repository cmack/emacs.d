(use-package emacs
  :hook (emacs-startup . turn-on-auto-fill)
  :custom
  (fill-column 78)
  (use-short-answers t)

  (column-number-mode t)

  (backup-by-copying t)
  (delete-old-versions t)
  (kept-new-versions 6)
  (kept-old-versions 2)
  (version-control t)
  (backup-directory-alist `(("." . ,(locate-user-emacs-file "backups"))))

  (auto-save-file-name-transforms `((".*" ,(locate-user-emacs-file  "autosaves") t)))
  ;; (add-to-list 'custom-theme-load-path (locate-user-emacs-file "themes"))
  (custom-theme-directory (locate-user-emacs-file "themes"))
  (custom-file (locate-user-emacs-file "custom.el"))

  (when (>= emacs-major-version 24)
    ;; (electric-pair-mode t)
    (electric-indent-mode t)
    (electric-layout-mode t))

  :bind (("M-SPC" . cycle-spacing)
         ;; Prevent accidental sleeping
         ("C-z" . nil)
         ("C-x C-z" . nil))
  :config
  (setq-default buffer-file-coding-system 'utf-8)
  (which-key-mode 1))

(use-package indent
  :bind
  ;; Handle JIS keyboard esp. on macOS
  (("C-M-¥" . indent-region))

  :custom
  (indent-tabs-mode nil)
  (tab-always-indent 'complete))

(use-package ediff
  :defer t
  :config
  (aggressive-indent-mode -1)
  (setq ediff-split-window-function 'split-window-horizontally
        ediff-window-setup-function 'ediff-setup-windows-plain))


(use-package browse-url
  :custom
  (browse-url-generic-program (and window-system *linux-p*
                                   (executeable-find "xdg-open")))
  (browse-url-handlers '(("hyperspec" . eww-browse-url))))

;; ;; TODO have graceful browser fallbacks
;; (when window-system
;;   (when-let ((path (and *linux-p*
;;                         (executable-find "xdg-open"))))
;;     (setq browse-url-generic-program path))
;;   (setq browse-url-browser-function
;;         (cond (*linux-p* 'browse-url-generic)
;;               (*mac-p* 'browse-url-default-macosx-browser)
;;               (*windows-p* 'browse-url-default-windows-browser))))

;; UTF-8
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)


(use-package mwheel
  :custom
    ;; Disable "inertia scrolling"
  (mouse-wheel-progressive-speed nil)

  (mouse-wheel-tilt-scroll t)
  (mouse-wheel-follow-mouse t)
  ;; Scroll less line per wheel move event
  (mouse-wheel-scroll-amount '(2 ((shift) . hscroll) ((control)))))

(use-package uniquify
  :ensure nil
  :config
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

(defun tabify-buffer ()
  "TABIFY the whole buffer."
  (interactive)
  (tabify (point-min) (point-max)))

(defun untabify-buffer ()
  "UNTABIFY the whole buffer."
  (interactive)
  (untabify (point-min) (point-max)))

(use-package whitespace
  :custom
  (show-trailing-whitespace t)
  :preface
  (defun cmack/show-trailing-whitespace-off ()
    "Turns off display of trailing whitespace."
    (setq-local show-trailing-whitespace nil))
  :hook
  ;; Show trailing whitespace exceptions
  ((eww-mode . cmack/show-trailing-whitespace-off)
   (minibuffer-setup . cmack/show-trailing-whitespace-off)
   (buffer-menu-mode . cmack/show-trailing-whitespace-off)
   (mastodon-mode . cmack/show-trailing-whitespace-off)))

(use-package prog-mode
  :commands prog-mode
  :hook ((before-save . whitespace-cleanup)
         (prog-mode . subword-mode)
         (prog-mode . flyspell-prog-mode)
         (prog-mode . show-paren-mode)))

(use-package cycle-quotes
  :ensure t
  :bind (("C-x C-'" . cycle-quotes)))

(use-package aggressive-indent
  :ensure t
  :disabled t
  :hook
  (prog-mode . aggressive-indent-mode))

(use-package swiper
  :ensure t
  :commands swiper
  :bind ("C-s" . swiper))

(use-package avy
  :ensure t
  :bind ("C-:" . avy-goto-char-timer))

(use-package which-key
  :ensure t
  :commands which-key-mode)

(use-package ispell
  :defer t
  :config
  (let ((executable (executable-find "hunspell")))
    (when executable
      (setq-default ispell-program-name executable)
      (setq ispell-command-name "hunspell"
            ispell-dictionary "en_US"
            ispell-really-hunspell t
            ispell-extra-args '("-a" "-i" "utf-8")))))

(use-package flyspell
  :commands (flyspell-prog-mode flyspell-mode)
  :custom
  (flyspell-issue-message-flag nil))

(use-package string-inflection
  :ensure t
  :bind ("C-c C-u" . string-inflection-all-cycle))

(use-package dumb-jump
  :ensure t
  :defer t
  :init
  ;; :hook doesn't work for this one since it doesn't use -hook suffix
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate 99 nil)
  :custom
  (dumb-jump-prefer-searcher 'rg)
  (dumb-jump-selector 'completing-read))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  ;; :disabled nil
  :custom
  ;; I needed these for a large Laravel+legacy app work

  ;; TODO: revisit necessity and scope. e.g. better to define a project scope
  ;; with dir-locals
  (lsp-file-watch-threshold 200000)
  (lsp-enable-file-watchers nil)

  ;; (setq lsp-response-timeout 2
  ;;       lsp-enable-eldoc t
  ;;       lsp-enable-completion-at-point t)
  :hook ((php-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration)))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  ;; :hook (lsp-mode . lsp-ui-mode)
  :bind (("M-." . lsp-ui-peek-find-definitions)
         ("M-?" . lsp-ui-peek-find-references))
  :config
  ;;  (setq lsp-ui-flycheck-enable t)
  )

(use-package editorconfig
  :ensure t
  :hook ((prog-mode . editorconfig-mode)))

(use-package recentf
  :hook ((after-init . recentf-mode)))

(provide 'init-behavior)
;;; init-behavior.el ends here
