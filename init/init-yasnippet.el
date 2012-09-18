(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(add-to-list 'yas-snippet-dirs
             (concat (file-name-directory (locate-library "yasnippet"))
                     "snippets"))

(provide 'init-yasnippet)
