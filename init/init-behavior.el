(setq-default fill-column 78)
(auto-fill-mode 1)
(column-number-mode t)

(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves" t)))
;; (setq auto-save-file-name-transforms
;;       '(("\\`/?\\([^/]*/\\)*\\([^/]*\\)\\'"  "~/.emacs.d/autosaves/\\2" t)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(setq-default indent-tabs-mode nil)

(use-package ediff
  :defer t
  :config
  (aggressive-indent-mode -1)
  (setq ediff-split-window-function 'split-window-horizontally
        ediff-window-setup-function 'ediff-setup-windows-plain))

(setq indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

;; TODO have graceful browser fallbacks
(when window-system
  (when *linux-p*
    (setq browse-url-generic-program "/usr/bin/xdg-open"))
  (setq browse-url-browser-function
        (cond (*linux-p* 'browse-url-generic)
              (*mac-p* 'browse-url-default-macosx-browser)
              (*windows-p* 'browse-url-default-windows-browser))))

;; UTF-8
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

(use-package mwheel
  :config
  ;; Disable "inertia scrolling"
  (setq mouse-wheel-progressive-speed nil)

  ;; Scroll less line per wheel move event
  (setq mouse-wheel-scroll-amount '(2 ((shift) . 1) ((control))))
  (setq mouse-wheel-follow-mouse t))

(when (>= emacs-major-version 24)
  ;; (electric-pair-mode t)
  (electric-indent-mode t)
  (electric-layout-mode t))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(setq custom-file "~/.emacs.d/custom.el")

(defun tabify-buffer ()
  "TABIFY the whole buffer."
  (interactive)
  (tabify (point-min) (point-max)))

(defun untabify-buffer ()
  "UNTABIFY the whole buffer."
  (interactive)
  (untabify (point-min) (point-max)))

(defun cmack/prog-mode-hook ()
  "My custom hook for prog-mode."
  (setq show-trailing-whitespace t)
  (subword-mode 1)
  (add-hook 'before-save-hook 'whitespace-cleanup)
  (flyspell-prog-mode)
  (show-paren-mode 1))

(defun cmack/after-init-hook ()
  "My custom hook for after init."
  (bind-key "M-SPC" #'cycle-spacing)
  (which-key-mode 1))

(add-hook 'after-init-hook #'cmack/after-init-hook)
(add-hook 'prog-mode-hook #'cmack/prog-mode-hook)

;;; Show trailing whitespace exceptions
(dolist (hook '(eww-mode-hook minibuffer-setup-hook buffer-menu-mode-hook))
  (add-hook hook (lambda ()
                   (setq show-trailing-whitespace nil))))

(use-package aggressive-indent
  :ensure t
  :defer 5
  :config
  (add-hook 'prog-mode-hook #'aggressive-indent-mode))

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

(use-package flyspell
  :commands (flyspell-prog-mode flyspell-mode)
  :config
  (setq ispell-command-name "aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")))

(use-package string-inflection
  :ensure t
  :bind ("C-c C-u" . string-inflection-all-cycle))

(use-package dumb-jump
  :ensure t
  :bind (("C-c f" . dumb-jump-go)
         ("C-c b" . dumb-jump-back)
         ("C-c x" . dumb-jump-go-prefer-external)
         ("C-c z" . dump-jump-go-prefer-external-other-window))
  :config
  (dumb-jump-mode)
  (setq dumb-jump-prefer-searcher 'rg))

(use-package lsp-mode
  :ensure t
  :commands lsp-mode
  ;; :disabled nil
  :config
  (setq lsp-response-timeout 25
        lsp-enable-flycheck t
        lsp-enable-eldoc t
        lsp-enable-completion-at-point t))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook ((lsp-mode . lsp-ui-mode)))
(provide 'init-behavior)
;;; init-behavior.el ends here
