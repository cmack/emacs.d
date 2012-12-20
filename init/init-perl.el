(add-hook 'cperl-mode-hook (lambda ()
                             (setq cperl-brace-offset 0)

                             (setq cperl-indent-level 2
                                   cperl-close-paren-offset (- cperl-indent-level))

                             (setq cperl-continued-brace-offset 0)
                             (setq cperl-continued-statement-offset 0)

                             (setq cperl-electric-keywords t
                                   cperl-electric-parens t
                                   cperl-electric-linefeed t
                                   cperl-electric-lbrace-space t)

                             (when (>= emacs-major-version 24)
                               (setq cperl-electric-parens nil
                                     cperl-electric-lbrace-space nil))

                             (setq cperl-extra-newline-before-brace t)
                             (setq cperl-brace-imaginary-offset 0)
                             (setq cperl-indent-parens-as-block t)
                             (setq cperl-indent-wrt-brace t)
                             (setq cperl-label-offset -2)
                             (setq cperl-merge-trailing-else t)
                             (setq indent-tabs-mode t)
                             (setq tab-width 2)
                             ))
(mapc
     (lambda (pair)
       (if (eq (cdr pair) 'perl-mode)
           (setcdr pair 'cperl-mode)))
     (append auto-mode-alist interpreter-mode-alist))

(provide 'init-perl)
