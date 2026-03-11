;; -*- lexical-binding: t; -*-
(use-package newsticker
  :ensure nil
  :bind ("C-x W" . newsticker-show-news)
  :custom
  (newsticker-date-format "(%A, %F %T)")
  ;; TODO: item list title button widths are hard-coded upstream.
  (newsticker-treeview-date-format "%F, %R ")
  (newsticker-url-list
   '(("Emacs News" "https://sachachua.com/blog/feed/")
     ("Planet Emacslife" "https://planet.emacslife.com/atom.xml")
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
     ("David Thompson" "https://dthompson.us/feed.xml")
     ("Graphics Programming Weekly" "https://jendrikillner.com/tags/weekly/index.xml")
     ("McCLIM upstream" "https://codeberg.org/McCLIM/McCLIM.rss")
     ("Jonas Hietala" "https://www.jonashietala.se/feed.xml")
     ("Mike Blumenkrantz" "https://www.supergoodcode.com/feed.xml")
     ("Use the Index Luke" "https://use-the-index-luke.com/blog/feed")
     ("Dave Pearson" "https://blog.davep.org/feeds/all.atom.xml"))))

(use-package gnus
  :ensure nil
  :after emacs-startup
  :custom
  (gnus-select-method '(nntp "news.gmane.io")))

(provide 'init-news)
;;; init-news.el ends here
