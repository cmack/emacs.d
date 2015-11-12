(use-package latex
  :ensure auctex
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :config
  (use-package pdf-tools
    :ensure t
    :config
    (pdf-tools-install)))

(use-package tex
  :defer t
  :config
  (setq TeX-view-program-selection '(((output-dvi style-pstricks)
                                      "dvips and gv")
                                     (output-dvi "xdvi")
                                     (output-pdf "PDF Tools")
                                     (output-html "xdg-open"))))

(provide 'init-tex)
