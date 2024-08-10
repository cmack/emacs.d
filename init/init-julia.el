;;; -*- lexical-binding: t -*-

(use-package julia-ts-mode
  :ensure t
  :mode (rx (: ".jl") eol))

(use-package julia-repl
  :ensure t
  :after julia-mode)

(use-package julia-snail
  :ensure t
  :after julia-mode)

(provide 'init-julia)
