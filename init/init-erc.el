(use-package erc
  :commands (erc-tls erc)
  :custom
  (erc-nick "cmack")
  (erc-autojoin-channels-alist '(("libera.chat"
                                  "#lisp" "#commonlisp" "#clim" "#sbcl" "#lispgames")))
  (erc-email-userid "charlie")
  (erc-modules '(autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring stamp track truncate))
  (erc-port 6697)
  (erc-server "irc.libera.chat")
  (erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "333" "353" "324" "329" "332" "477"))
  (erc-hide-list '("JOIN" "NICK" "PART" "QUIT")))

(provide 'init-erc)
