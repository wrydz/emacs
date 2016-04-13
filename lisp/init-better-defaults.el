;; 关闭备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 打开recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; 改变外部文件自动加载
(global-auto-revert-mode t)

;; 打开括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 开启缩写补全
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("wr" "wrydz")
					    ))

(defun region-buffer()
  (message "")
  (interactive)
  (indent-region (point min) (point max)))

;; 在org中使_到处下划线
(setq org-export-with-sub-superscripts (quote {}))

(provide 'init-better-defaults)
