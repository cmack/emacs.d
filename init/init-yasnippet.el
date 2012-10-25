(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(add-to-list 'yas-snippet-dirs
             (concat (file-name-directory (locate-library "yasnippet"))
                     "snippets"))

(add-hook 'html-mode-hook (lambda ()
                            (setq ac-sources '(ac-source-semantic ac-source-yasnippet))))

(provide 'init-yasnippet)
