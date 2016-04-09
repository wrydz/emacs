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

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; 自动输入匹配括号或引号
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; 删除多个空格
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 全局打开company自动补全
(global-company-mode t)

;; load monokai theme
(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(defun tramp-term--initialize (hostname)
  "Send bash commands to set up tramp integration."
  (term-send-raw-string (format "
alias precmd 'echo \"\\033AnSiTu\" \"zhjs\"; echo \"\\033AnSiTc\" \"1011@Zhjs\"; echo \"\\033AnSiTh\" \"%s\"'
clear
" hostname)))

(provide 'init-packages)
