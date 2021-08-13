;;; init-org.el --- Org mode config      -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package org
  :commands (org-mode org-agenda org-capture)
  :init
  (setq org-agenda-files (list "~/Dropbox/org/work.org"
                               "~/Dropbox/org/home.org"))
  (defun cmack/org-mode-hook ()
    (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t)
    (push '(company-capf :with company-yasnippet) company-backends))

  :bind
  ("C-c a" . org-agenda)
  ("C-c r" . org-capture)

  :config
  (setq org-pretty-entities t
        org-return-follows-link t
        org-startup-indented t
        org-src-preserve-indentation t
        org-list-allow-alphabetical t)
  :hook
  ((org-mode . visual-line-mode)
   (org-mode . company-mode)
   (org-mode . cmack/org-mode-hook)))

(use-package ox-md
  :after org)

(use-package ox-reveal
  :ensure t
  :after org)

(use-package org-roam
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/Documents/org-files/")
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-show-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert)
               ("C-c n I" . org-roam-insert-immediate)))
  :config
  (setq org-roam-completion-system 'helm))

(provide 'init-org)
;;; init-org.el ends here
