;;; init-project --- Summary
;;; Commentary:

;;; Code:
(use-package find-file-in-project
  :config
  (evil-leader/set-key
    "pf" 'find-file-in-project))

(use-package projectile
  :config
  (projectile-mode +1))

(provide 'init-project)
;;; init-project ends here
