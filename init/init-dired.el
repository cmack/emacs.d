(use-package dired+
  :ensure t
  :defer t
  :config
  (progn
    (defun file-delete-trailing-whitespace (file-path)
      "Removes trailing whitespace from file at FILE-PATH"
      (with-temp-file file-path
        (insert-file-contents file-path)
        (delete-trailing-whitespace 1 nil)))

    (defun dired-bulk-delete-trailing-whitespace ()
      (interactive)
      ;; (require 'dired)
      (mapc 'file-delete-trailing-whitespace (dired-get-marked-files)))))

(provide 'init-dired)
