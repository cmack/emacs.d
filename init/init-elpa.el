;;; init-elpa --- Elpa customizations   -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
;;------------------------------------------------------------------------------
;; Standard package repositories
;;------------------------------------------------------------------------------
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;;------------------------------------------------------------------------------
;; Fire up package.el and ensure the following packages are installed.
;;------------------------------------------------------------------------------

(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(use-package diminish :ensure t)

(use-package exec-path-from-shell
  :if *mac-p*
  :ensure t
  :defer 1
  :config
  ;; Don't warn me about startup files
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(use-package rainbow-mode
  :ensure t
  :commands rainbow-mode)

(when (< emacs-major-version 24)
  (use-package org :ensure t))

(use-package rainbow-delimiters
  :ensure t
  :commands rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode))

;; (require-package 'ace-jump-mode)
;; (require-package 'fill-column-indicator)
;; (require-package 'expand-region)
;; (require-package 'fringe-helper)
;; (require-package 'gnuplot)
;; (require-package 'haskell-mode)
;; (require-package 'tuareg)
;; (require-package 'flymake-cursor)
;; (require-package 'csv-mode)
;; (require-package 'csv-nav)
;; (require-package 'js3-mode)
;; (require-package 'lua-mode)
;; (require-package 'project-local-variables)
;; (require-package 'ruby-mode)
;; (require-package 'inf-ruby)
;; (require-package 'yari)
;; (require-package 'rvm)
;; (require-package 'eldoc-eval)
;; (require-package 'legalese)
;; (require-package 'erlang)
;; (require-package 'slime)
;; (require-package 'slime-fuzzy)
;; (require-package 'slime-repl)
;; (require-package 'gist)
;; (require-package 'org-fstree)
;; (require-package 'htmlize)
;; (require-package 'clojure-test-mode)
;; (require-package 'autopair)
;; (require-package 'js-comint)
;; (require-package 'smarty-mode)
;; (require-package 'scratch)
;; (require-package 'todochiku)
;; (require-package 'pretty-mode)
;; (require-package 'ac-slime)
;; (require-package 'ac-nrepl)
;; (require-package 'crontab-mode)
;; (require-package 'elisp-slime-nav)
;; (require-package 'hippie-expand-slime)
;; (require-package 'hl-sexp)
;; (require-package 'ibuffer-vc)
;; (require-package 'less-css-mode)
;; (require-package 'lively)
;; (require-package 'move-text)
;; (require-package 'mwe-log-commands)
;; (require-package 'pointback)
;; (require-package 'regex-tool)
;; (require-package 'rinari)
;; (require-package 'ruby-compilation)
;; (require-package 'session)
;; (require-package 'tidy)
;; (require-package 'unfill)
;; (require-package 'whole-line-or-region)

(provide 'init-elpa)
