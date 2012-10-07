;; -*- coding: utf-8 -*-
(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))

(defconst *spell-check-support-enabled* nil)
(defconst *windows-p* (eq system-type 'windows-nt))
(defconst *linux-p* (eq system-type 'gnu/linux))
(defconst *mac-p* (eq system-type 'darwin))
(defconst *carbon-emacs-p* (and *mac-p* (eq window-system 'mac)))
(defconst *cocoa-emacs-p* (and *mac-p* (eq window-system 'ns)))

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

(require 'init-appearence)
(require 'init-behavior)
(require 'init-elpa)
(require 'init-ido)
(require 'init-auto-complete)
(require 'init-git)
(require 'init-powerline)
;;; Mode support
(require 'init-javascript)
(require 'init-perl)
(require 'init-ruby)
(require 'init-erc)
(require 'init-scss)
;; (require 'init-common-lisp)

(require 'init-yasnippet)


(load custom-file)
