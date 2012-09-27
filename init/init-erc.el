(setq erc-autojoin-channels-alist '(("#lisp" "#yui" "#sbcl" "#ruby"))
      erc-email-userid "charlie"
      erc-modules '(autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring stamp track truncate)
      erc-port 6667
      erc-server "irc.freenode.net"
      erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "333" "353" "324" "329" "332" "477")
      erc-hide-list '("JOIN" "NICK" "PART" "QUIT")))

(provide 'init-erc)
