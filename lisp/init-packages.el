;;; package --- init-packages
;;; Commentary:
;;; Code:

(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://elpa.zilongshanren.com/melpa/") t)
  )

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
			 chinese-fonts-setup
			 auto-dictionary
			 youdao-dictionary
			 flycheck
			 keyfreq
			 auto-yasnippet
			 iedit
			 evil
			 evil-leader
			 evil-escape
			 evil-surround
			 window-numbering
			 evil-nerd-commenter
			 which-key
			 helm-ag
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

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; delete few whitespaces
(global-hungry-delete-mode)

;; enable blobal company
(global-company-mode t)

;; load monokai theme
(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

;; open org-bullets
;;(require 'org-bullets)
;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; yasnippet
;; (require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all)
(add-hook 'prog-mode-hook 'yas-minor-mode)

;; flyspell
(require 'auto-dictionary)
(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

;; 配置中英文字体及大小
;;(require 'chinese-fonts-setup)

;; youdao-dictionary
;; Enable Cache
(setq url-automatic-caching t)

;; flycheck
;;(global-flycheck-mode)

;;
;;(require 'iedit-mode)

;; evil
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; evil-leader
(global-evil-leader-mode)

(evil-escape-mode)

(window-numbering-mode 1)

(require 'evil-surround)
(global-evil-surround-mode)

;; 快速添加注释
(evilnc-default-hotkeys)

(which-key-mode)

(provide 'init-packages)
