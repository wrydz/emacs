;; 打开org-mode中src的代码高亮
(require 'org)
(setq org-src-fontify-natively t)
;; open org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; open agenda
(setq org-agenda-files '("/home/wrydz/GTD/work.org"
			 "/home/wrydz/GTD/notes.org"
			 "/home/wrydz/GTD/ideas.org"
			 "/home/wrydz/GTD/inbox.org"
			 "/home/wrydz/GTD/finished.org"
			 "/home/wrydz/GTD/tasks.org"))

(provide 'init-org)
