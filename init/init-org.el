(use-package org
  :defer t
  :init
  (setq org-agenda-files (list "~/Dropbox/org/work.org"
                               "~/Dropbox/org/home.org"))
  :bind
  ("C-c a" . org-agenda)
  ("C-c r" . org-capture)

  :config
  (defun cmack/org-mode-hook ()
    (visual-line-mode t)
    (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t)
    (company-mode t)
    (push '(company-capf :with company-yasnippet) company-backends))

  (setq org-pretty-entities t
        org-return-follows-link t
        org-startup-indented t
        org-src-preserve-indentation t
        org-list-allow-alphabetical t)

  (add-hook 'org-mode-hook #'cmack/org-mode-hook))

(use-package ox-md
  :after org)

(use-package ox-reveal
  :ensure t
  :after org)

(provide 'init-org)
