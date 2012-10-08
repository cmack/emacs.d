(require 'cl)

(setq fill-column 78)
(auto-fill-mode t)
(column-number-mode t)

(show-paren-mode 1)

(setq backup-by-copying t)
(setq backup-directory-alist '((".*" . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1")))

(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

;; TODO have graceful browser fallbacks 
(setq browse-url-generic-program "chromium-browser"
      browse-url-browser-function 'browse-url-generic)


;; UTF-8
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)


(when (>= emacs-major-version 24)
  (electric-pair-mode t)
  (electric-indent-mode t)
  (electric-layout-mode t))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(setq custom-file "~/.emacs.d/custom.el")



(provide 'init-behavior)
