(use-package clojure-mode
  :ensure t
  :commands clojure-mode
  :config
  (add-hook 'clojure-mode-hook 'paredit-mode))

(use-package clojure-mode-extra-font-locking
  :ensure t
  :after clojure-mode)

(use-package cider
  :ensure t
  :commands cider-mode
  :config
  (setq nrepl-popup-stacktraces nil)
  (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
  (add-hook 'cider-repl-mode-hook 'paredit-mode))

(use-package flycheck-clojure
  :ensure t
  :commands clojure-mode
  :config
  (flycheck-clojure-setup))

(use-package clojurescript-mode
  :ensure t
  :commands clojurescript-mode)

(provide 'init-clojure)
