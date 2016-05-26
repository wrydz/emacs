
;; enable highlight in org mode src
(setq org-src-fontify-natively t)

;; open agenda
(setq org-agenda-files '("e:/GTD"))

;; indent in org mode
(setq org-startup-indented t)

;;
(setq mark-holidays-in-calendar t)
(setq my-holidays
      '(
	(holiday-fixed 2 14 "情人节")
	(holiday-lunar 4 1 "老婆生日")
	))
(setq calendar-holidays my-holidays)

;; config org templates
(setq org-capture-templates
      '(("c" "Todo" entry (file+headline "e://GTD//tasks.org" "Company")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)
	("p" "Todo" entry (file+headline "e:/GTD/tasks.org" "Periodic")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)
	))

(provide 'init-org)
