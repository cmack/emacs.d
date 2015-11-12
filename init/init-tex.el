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
  (unless (assoc "PDF Tools" TeX-view-program-list-builtin)
    (push '("PDF Tools" TeX-pdf-tools-sync-view) TeX-view-program-list))

  (setq TeX-view-program-selection
        (cond (*linux-p*
               '(((output-dvi style-pstricks)
                  "dvips and gv")
                 (output-dvi "xdvi")
                 (output-pdf "PDF Tools")
                 (output-html "xdg-open")))
              (*mac-p*
               '((output-dvi "open")
                 (output-pdf "PDF Tools")
                 (output-html "open"))))))

(provide 'init-tex)
