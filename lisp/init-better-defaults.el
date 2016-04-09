;; 关闭备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 打开recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(global-auto-revert-mode t)

;; 打开括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-better-defaults)
