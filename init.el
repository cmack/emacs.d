;;; init.el --- My config     -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(add-to-list 'load-path (directory-file-name (locate-user-emacs-file "init")))

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
(if (fboundp 'horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode -1))

(setq inhibit-startup-message t)

(require 'init-elpa)
(require 'init-behavior)
(require 'init-appearence)
(require 'init-editing-utils)
(require 'init-flycheck)
(require 'init-dired)
;; (require 'init-helm)
(require 'init-selectrum)
(require 'init-projectile)
(require 'init-input)
;; (require 'init-ido)
(require 'init-company)
;; (require 'init-auto-complete)
(require 'init-git)
;; (require 'init-powerline)
;;; Mode support
(require 'init-common-lisp)
(require 'init-clojure)
(require 'init-javascript)
(require 'init-perl)
(require 'init-python)
(require 'init-php)
(require 'init-ruby)
(require 'init-erc)
(require 'init-web)

(require 'init-yasnippet)
(require 'init-tex)
(require 'init-sql)
(require 'init-org)
(require 'init-terraform)
(require 'init-csv)

(require 'init-news)

(load custom-file)
