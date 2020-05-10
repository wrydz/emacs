;;; init-better-defaults --- Summary
;;; Commentary:


;;; Code:

;; 关闭备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 改变外部文件自动加载
(global-auto-revert-mode t)

;; 关闭告警声
(setq visible-bell 0)

;; 打开括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 开启缩写补全
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("wr" "wrydz")
					    ))

(defun indent-buffer()
  "Aaaa a aaaa."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))


;; 使补全在引号内正常工作
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))
;; 简化yes 和 no
(fset 'yes-or-no-p 'y-or-n-p)
;; dired-mode 中删除文件夹总是允许递归删除子文件
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
;; 在dired-mode 中重用同一个buffer
(put 'dired-find-alternate-file 'disabled nil)

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)

(setq dired-dwim-target t)

;; 选中输入直接覆盖
(delete-selection-mode t)

;; 在lisp模式中取消自动补全单引号
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

;; 高亮光标所在两端的括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 25)
  :custom
  (recentf-auto-cleanup "05:00am")
  (recentf-max-saved-items 200)
  (recentf-exclude '((expand-file-name package-user-dir)
                     ".cache"
                     ".cask"
                     ".elfeed"
                     "bookmarks"
                     "cache"
                     "ido.*"
                     "persp-confs"
                     "recentf"
                     "undo-tree-hist"
                     "url"
                     "COMMIT_EDITMSG\\'")))

;; When buffer is closed, saves the cursor location
(save-place-mode 1)

;; Set history-length longer
(setq-default history-length 500)

;; find file in default directory
(setq default-directory "~/")

;; load shell env
(use-package exec-path-from-shell
 :if (memq window-system '(mac ns x))
 :ensure t
 :config
 (exec-path-from-shell-initialize))


(provide 'init-better-defaults)
;;; init-better-defaults ends here
