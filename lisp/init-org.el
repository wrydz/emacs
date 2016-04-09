;; 打开org-mode中src的代码高亮
(require 'org)
(setq org-src-fontify-natively t)
;; open org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(provide 'init-org)
