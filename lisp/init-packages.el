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
			 chinese-fonts-setup
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
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all)
(add-hook 'prog-mode-hook 'yas-minor-mode)

;;
(require 'chinese-fonts-setup)

(provide 'init-packages)
