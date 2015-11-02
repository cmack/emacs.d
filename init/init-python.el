(use-package python-mode
  :config
  (use-package jedi :disabled t)

  (use-package ipython
    :disabled t
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

  (use-package elpy
    :commands elpy-enable
    :config
    (setq elpy-rpc-python-command "python3"))
  (elpy-enable))



(provide 'init-python)
