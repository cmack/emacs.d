(use-package org
  :defer t
  :init
  (setq org-agenda-files (list "~/Dropbox/org/work.org"
                               "~/Dropbox/org/home.org"))
  :config
  (use-package ox-md :ensure t))


(provide 'init-org)
