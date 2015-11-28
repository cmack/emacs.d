(use-package clojure-mode
  :ensure t
  :commands clojure-mode
  :config
  (add-hook 'clojure-mode-hook 'paredit-mode))

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

(provide 'init-clojure)
