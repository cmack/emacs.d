(require 'package)
;;------------------------------------------------------------------------------
;; Standard package repositories
;;------------------------------------------------------------------------------

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;;------------------------------------------------------------------------------
;; On-demand installation of packages
;;------------------------------------------------------------------------------

(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

;;------------------------------------------------------------------------------
;; Fire up package.el and ensure the following packages are installed.
;;------------------------------------------------------------------------------

(package-initialize)

;; (require-package 'ido-ubiquitous)
(when (< emacs-major-version 24)
  (require-package 'color-theme))
;; (require-package 'ace-jump-mode)
;; (require-package 'fill-column-indicator)
;; (require-package 'mark-multiple)
;; (require-package 'expand-region)
;; (require-package 'fringe-helper)
;; (require-package 'popup)
;; (require-package 'gnuplot)
;; (require-package 'haskell-mode)
;; (require-package 'tuareg)
(require-package 'magit)
;; (require-package 'git-blame)
;; (require-package 'flymake-cursor)
;; (require-package 'csv-mode)
;; (require-package 'csv-nav)
(require-package 'json)
;; (require-package 'js3-mode)
(require-package 'js2-mode)
;; (require-package 'lua-mode)
;; (require-package 'project-local-variables)
;; (require-package 'ruby-mode)
;; (require-package 'inf-ruby)
;; (require-package 'yari)
;; (require-package 'rvm)
;; (require-package 'yaml-mode)
(require-package 'paredit)
;; (require-package 'eldoc-eval)
;; (require-package 'legalese)
;; (require-package 'erlang)
;; (require-package 'slime)
;; (require-package 'slime-fuzzy)
;; (require-package 'slime-repl)
;; (require-package 'gist)
(require-package 'haml-mode)
(require-package 'scss-mode)
(require-package 'sass-mode)
;; (require-package 'elein)
;; (require-package 'durendal)
(require-package 'markdown-mode)
(require-package 'smex)
(require-package 'dired+)
(require-package 'rainbow-mode)
;; (require-package 'maxframe)
(when (< emacs-major-version 24)
  (require-package 'org))
;; (require-package 'org-fstree)
;; (require-package 'htmlize)
;; (require-package 'clojure-mode)
;; (require-package 'clojure-test-mode)
;; (require-package 'clojurescript-mode)
;; (require-package 'nrepl)
;; (require-package 'diminish)
;; (require-package 'autopair)
;; (require-package 'js-comint)
;; (require-package 'php-mode)
;; (require-package 'smarty-mode)
;; (require-package 'scratch)
;; (require-package 'mic-paren)
;; (require-package 'rainbow-delimiters)
;; (require-package 'todochiku)
;; (require-package 'marmalade)
;; (require-package 'textile-mode)
;; (require-package 'darcsum)
;; (require-package 'pretty-mode)

;; (require-package 'ac-slime)
;; (require-package 'ac-nrepl)
;; (require-package 'coffee-mode)
;; (require-package 'color-theme-sanityinc-solarized)
;; (require-package 'color-theme-sanityinc-tomorrow)
;; (require-package 'crontab-mode)
;; (require-package 'dsvn)
;; (require-package 'elisp-slime-nav)
;; (require-package 'exec-path-from-shell)
;; (require-package 'flymake-coffee)
;; (require-package 'flymake-css)
;; (require-package 'flymake-haml)
;; (require-package 'flymake-jslint)
;; (require-package 'flymake-php)
;; (require-package 'flymake-python-pyflakes)
;; (require-package 'flymake-ruby)
;; (require-package 'flymake-sass)
;; (require-package 'flymake-shell)
;; (require-package 'hippie-expand-slime)
;; (require-package 'hl-sexp)
;; (require-package 'ibuffer-vc)
;; (require-package 'less-css-mode)
;; (require-package 'lively)
;; (require-package 'mmm-mode)
;; (require-package 'move-text)
;; (require-package 'mwe-log-commands)
;; (require-package 'pointback)
;; (require-package 'regex-tool)
;; (require-package 'rinari)
;; (require-package 'ruby-compilation)
;; (require-package 'session)
;; (require-package 'tidy)
;; (require-package 'unfill)
;; (require-package 'vc-darcs)
;; (require-package 'whole-line-or-region)
(require-package 'auto-complete)
(require-package 'yasnippet)

(provide 'init-elpa)
