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

(unless (package-installed-p 'evil)
  (package-install 'use-package))
(require 'use-package)

(setq use-package-always-ensure t)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t)
)

;; delete few whitespaces
(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode)
)

;; enable blobal company
;;(global-company-mode t)

;; load monokai theme
;;(load-theme 'monokai t)

;;(require 'popwin)
;;(popwin-mode t)

;; open org-bullets
;;(require 'org-bullets)
;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; yasnippet
;; (require 'yasnippet)
;;(yas-global-mode 1)
;;(yas-reload-all)
;;(add-hook 'prog-mode-hook 'yas-minor-mode)

;; flyspell
;;(require 'auto-dictionary)
;;(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

;; youdao-dictionary
;; Enable Cache
;;(setq url-automatic-caching t)

;; flycheck
;;(global-flycheck-mode)

;;
;;(require 'iedit-mode)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))

  (use-package evil-escape
    :ensure t
    :config
    (evil-escape-mode))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
  )

(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode 1))

;; 快速添加注释
;;(evilnc-default-hotkeys)

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
)


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
;;; init-packages.el ends here
