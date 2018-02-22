(use-package elpy
  :commands python-mode
  :config
  (setq elpy-rpc-python-command "python3")
  (elpy-enable))

(use-package jedi
  :disabled t
  :after python-mode)

(use-package ipython
  :disabled t
  :after python-mode
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args ""
        python-shell-prompt-regexp "In \\[[0-9]+\\]: "
        python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
        python-shell-completion-setup-code
        "from IPython.core.completerlib import module_completion"
        python-shell-completion-module-string-code
        "';'.join(module_completion('''%s'''))\n"
        python-shell-completion-string-code
        "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(use-package python-mode
  :disabled t)

(use-package python
  :commands python-mode
  :config
  (setq python-shell-interpreter "python3")
  (elpy-enable))

(provide 'init-python)
