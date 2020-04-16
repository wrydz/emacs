;;; package --- init-packages
;;; Commentary:
;;; Code:

(require 'cl)

(when (>= emacs-major-version 26)
  (require 'package)
  ;;  (add-to-list 'package-archives '("melpa" . "http://elpa.zilongshanren.com/melpa/") t)
  (setq package-archives
	'(("melpa-cn" . "http://192.168.31.188:8087/elpa/melpa/")
          ("org-cn"   . "http://192.168.31.188:8087/elpa/org/")
          ("gnu-cn"   . "http://192.168.31.188:8087/elpa/gnu/")
          )
	))

;; add whatever packages you want here
(defvar wrydz/packages '(
			 company
			 company-box
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
                         use-package
			 all-the-icons
			 cnfonts
			 treemacs
			 lsp-mode
			 lsp-ui
			 lsp-treemacs
			 projectile
			 exec-path-from-shell
			 powerline
			 scala-mode
			 projectile
			 find-file-in-project
			 sqlformat
			 org-bullets
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


(use-package ivy
  :diminish
  :init
  (use-package amx :defer t)
  (use-package counsel :diminish :config (counsel-mode 1))
  (use-package swiper :defer t)
  (ivy-mode 1)
  :bind
  (("C-s" . swiper-isearch)
   ("C-c C-b" . counsel-ibuffer)
   (:map ivy-minibuffer-map
         ("C-r" . ivy-previous-line-or-history)
         ("M-RET" . ivy-immediate-done))
   (:map counsel-find-file-map
         ("C-~" . counsel-goto-local-home)))
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-height 10)
  (ivy-on-del-error-function nil)
  (ivy-magic-slash-non-match-action 'ivy-magic-slash-non-match-create)
  (ivy-count-format "【%d/%d】")
  (ivy-wrap t)
  :config
  (defun counsel-goto-local-home ()
    "Go to the $HOME of the local machine."
    (interactive)
    (ivy--cd "~/")))

(provide 'init-packages)
;;; init-packages ends here
