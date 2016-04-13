;; enable highlight in org mode src
(setq org-src-fontify-natively t)

;; open agenda
(setq org-agenda-files '("/home/wrydz/GTD/work.org"
			 "/home/wrydz/GTD/notes.org"
			 "/home/wrydz/GTD/ideas.org"
			 "/home/wrydz/GTD/inbox.org"
			 "/home/wrydz/GTD/finished.org"
			 "/home/wrydz/GTD/tasks.org"))

;;
(setq mark-holidays-in-calendar t)
(setq my-holidays
      '(
	(holiday-fixed 2 14 "情人节")
	(holiday-lunar 4 1 "老婆生日")
	))
(setq calendar-holidays my-holidays)

(provide 'init-org)
