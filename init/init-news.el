(use-package newsticker
  :ensure nil
  :bind ("C-x W" . newsticker-show-news)
  :custom
  (newsticker-date-format "(%A, %F %T)")
  ;; TODO: item list title button widths are hard-coded upstream.
  (newsticker-treeview-date-format "%F, %R ")
  (newsticker-url-list
   '(("Planet Emacslife" "https://planet.emacslife.com/atom.xml")
     ("Mastering Emacs" "http://www.masteringemacs.org/feed/")
     ("Oremacs" "https://oremacs.com/atom.xml")
     ("EmacsCast" "https://pinecast.com/feed/emacscast")
     ("Emacs TIL" "https://emacstil.com/feed.xml")
     ("Planet Lisp" "http://planet.lisp.org/rss20.xml")
     ("Planet SBCL" "http://planet.sbcl.org/rss20.xml")
     ("Planet Scheme" "https://planet.scheme.org/atom.xml")
     ("Matthew Ström" "https://matthewstrom.com/feed.xml")
     ("Wingolog" "https://wingolog.org/feed/atom")
     ("Futurile" "https://www.futurile.net/feeds/all.atom.xml")
     ("David Thompson" "https://dthompson.us/feed.xml"))))
