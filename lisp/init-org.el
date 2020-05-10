;;; init-org --- Summary:
;;; Commentary:

;;; Code:

(with-eval-after-load 'org

  (progn
    ;; enable highlight in org mode src
    (setq org-src-fontify-natively t)

    ;; indent in org mode
    (setq org-startup-indented t)

    ;; open agenda
    (setq org-agenda-files '("~/org-notes"))

    ;; 在org中使_导出为下划线
    ;; (setq org-export-with-sub-superscripts (quote {}))

    (use-package org-bullets
      :ensure t
      ;; :hook (org-mode . 'org-bullets-mode))
      :config (add-hook 'org-mode-hook #'org-bullets-mode))



    ;; (setq mark-holidays-in-calendar t)
    ;; (setq my-holidays
    ;; 	  '(
    ;; 	    (holiday-fixed 2 14 "情人节")
    ;; 	    (holiday-lunar 4 1 "老婆生日")
    ;; 	    ))
    ;; (setq calendar-holidays my-holidays)


    ;; config org templates
    (setq org-capture-templates
	  '(("c" "Todo" entry (file+headline "e://GTD//tasks.org" "Company")
	     "* TODO [#B] %?\n  %i\n"
	     :empty-lines 1)
	    ("p" "Todo" entry (file+headline "e:/GTD/tasks.org" "Periodic")
	     "* TODO [#B] %?\n  %i\n"
	     :empty-lines 1)
	    ))



    (with-eval-after-load 'org-agenda
      (use-package org-projectile
	:bind (("C-c n p" . org-projectile-project-todo-completing-read)
	       ("C-c c" . org-capture))
	:config
	(progn
	  (setq org-projectile-projects-file
		"/your/path/to/an/org/file/for/storing/projects.org")
	  (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
	  (push (org-projectile-project-todo-entry) org-capture-templates)
	  (push (org-projectile:todo-files) org-agenda-files))
	:ensure t)
      )
    ))



(provide 'init-org)
;;; init-org.el ends here
