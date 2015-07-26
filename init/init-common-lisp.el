(use-package paredit
  :ensure t
  :defer t)

(use-package slime
  :ensure t
  :defer t
  :config
  (progn
    (require 'slime-autoloads)
    ;;some niftiness nicked from Bill Clementson
    ;; (defun bc-slime-connect ()
    ;;   "Connect to Swank with defaults."
    ;;   (interactive)
    ;;   (slime-connect slime-lisp-host (format "%d" slime-port)))

    (setq inferior-lisp-program "sbcl"
          slime-complete-symbol*-fancy t
          slime-complete-symbol-function 'slime-fuzzy-complete-symbol
          slime-when-complete-filename-expand t
          slime-truncate-lines nil
          slime-autodoc-use-multiline-p t
          slime-net-coding-system 'utf-8-unix
          slime-startup-animation nil
          slime-port 4005
          common-lisp-hyperspec-root "/home/charlie/lisp/HyperSpec/")

    (slime-setup '(slime-fancy slime-asdf slime-banner))

    ;; (define-key slime-repl-mode-map (kbd "C-c ;") 'slime-insert-balanced-comments)
    ;; (define-key slime-repl-mode-map (kbd "C-c M-;") 'slime-remove-balanced-comments)
    ;; (define-key slime-mode-map (kbd "C-c ;") 'slime-insert-balanced-comments)
    ;; (define-key slime-mode-map (kbd "C-c M-;") 'slime-remove-balanced-comments)
    ;; (define-key slime-mode-map (kbd "RET") 'newline-and-indent)
    ;; (define-key slime-mode-map (kbd "<return>") 'newline-and-indent)
    ;; (define-key slime-mode-map (kbd "C-j") 'newline)

    (add-hook 'lisp-mode-hook (lambda ()
                                (cond ((not (featurep 'slime))
                                       (require 'slime)
                                       (normal-mode)))
                                (modify-syntax-entry ?- "w")))))


;; LispDoc access from Bill Clementson
(defun lispdoc ()
  "Searches lispdoc.com for SYMBOL, which is by default the symbol
currently under the curser"
  (interactive)
  (let* ((word-at-point (word-at-point))
         (symbol-at-point (symbol-at-point))
         (default (symbol-name symbol-at-point))
         (inp (read-from-minibuffer
               (if (or word-at-point symbol-at-point)
                   (concat "Symbol (default " default "): ")
                    "Symbol (no default): "))))
    (if (and (string= inp "")
              (not word-at-point)
               (not
                   symbol-at-point))
        (message "you didn't enter a symbol!")
      (let ((search-type (read-from-minibuffer
                            "full-text (f) or basic (b) search (default b)? ")))
        (browse-url (concat "http://lispdoc.com?q="
                                (if (string= inp "")
                                    default
                                          inp)
                                    "&search;="
                                        (if (string-equal search-type "f")
                                            "full+text+search"
                                                  "basic+search")))))))
;; Paredit
(mapc (lambda (mode)
        (let ((hook (intern (concat (symbol-name mode)
                                    "-mode-hook"))))
          (add-hook hook (lambda () (paredit-mode +1)))))
      '(emacs-lisp lisp inferior-lisp))

(provide 'init-common-lisp)
