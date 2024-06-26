(add-to-list 'default-frame-alist
             (cond (*linux-p*
                    '(font . "-*-Source Code Pro-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1" ))
                   (*mac-p*
                    '(font . "-*-Source Code Pro-regular-r-normal-*-16-*-*-*-m-0-iso10646-1" ))
                   (*windows-p*
                    '(font . "-unknown-Inconsolata-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1" ))))

(when *cocoa-emacs-p*
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(use-package color-theme
  :if (< emacs-major-version 24))

(use-package planet-theme
  :ensure t
  :if (and window-system (>= emacs-major-version 24))
  :init
  (load-theme 'planet t))

(provide 'init-appearence)
