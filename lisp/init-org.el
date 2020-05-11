;;; init-org --- Summary:
;;; Commentary:

;;; Code:

(with-eval-after-load 'org

  (progn
    ;; enable highlight in org mode src
    (setq org-src-fontify-natively t)

    ;; indent in org mode
    (setq org-startup-indented t)


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

    ;; open agenda
    (setq org-agenda-files '("~/org-notes"))
    (setq org-agenda-dir "~/org-notes/")
    (setq org-agenda-file-gtd (concat org-agenda-dir "gtd.org"))
    (setq org-agenda-file-note (concat org-agenda-dir "note.org"))

    ;; config org templates
    (setq org-capture-templates
	  '(("t" "Todo" entry (file+headline org-agenda-file-gtd "Workspace")
	     "* TODO [#B] %?\n  %i\n"
	     :empty-lines 1)
	    ("p" "personal" entry (file+headline org-agenda-file-gtd "Personal")
	     "* TODO [#B] %?\n  %i\n"
	     :empty-lines 1)
	    ("i" "Todo" entry (file+headline org-agenda-file-note "Ideas")
	     "* TODO [#B] %?\n  %i\n"
	     :empty-lines 1)
	    ))

    (evil-leader/set-key "aoc" 'org-capture)


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
