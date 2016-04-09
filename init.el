(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )
(require 'cl)

;; add whatever packages you want here
(defvar wrydz/packages '(
			 company
			 monokai-theme
			 hungry-delete
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 org-bullets
			 tramp-term
			 yasnippet
			 popwin
			 ) "Default packages")
(setq package-selecteqd-packages wrydz/packages)

(defun wrydz/packages-installed-p ()
  (loop for pkg in wrydz/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (wrydz/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg wrydz/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; 自动输入匹配括号或引号
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; 删除多个空格
(require 'hungry-delete)
(global-hungry-delete-mode)
;; Hide tool bar,scroll bar and Show line number
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-linum-mode t)
;; 关闭启动画面
(setq inhibit-splash-screen t)
;; 关闭备份文件
(setq make-backup-files nil)
;; 全局打开company自动补全
(global-company-mode t)
;; Change cursor style
(setq-default cursor-type 'bar)
;; 全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; 打开recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; load monokai theme
(load-theme 'monokai t)
;; 打开org-mode中src的代码高亮
(require 'org)
(setq org-src-fontify-natively t)
;; open org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; 打开括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(require 'popwin)
(popwin-mode t)

(defun tramp-term--initialize (hostname)
  "Send bash commands to set up tramp integration."
  (term-send-raw-string (format "
alias precmd 'echo \"\\033AnSiTu\" \"zhjs\"; echo \"\\033AnSiTc\" \"1011@Zhjs\"; echo \"\\033AnSiTh\" \"%s\"'
clear
" hostname)))

;; 高亮当前行
(global-hl-line-mode t)

;; open agenda
(setq org-agenda-files '("/home/wrydz/GTD/work.org"
			 "/home/wrydz/GTD/notes.org"
			 "/home/wrydz/GTD/ideas.org"
			 "/home/wrydz/GTD/inbox.org"
			 "/home/wrydz/GTD/finished.org"
			 "/home/wrydz/GTD/tasks.org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
