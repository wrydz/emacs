(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfs--current-profile-name "profile1" t)
 '(cfs--fontsize-steps '(4 3 4) t)
 '(company-idle-delay 0.08 t)
 '(company-minimum-prefix-length 1 t)
 '(evil-leader/leader "SPC")
 '(evil-want-C-u-scroll t)
 '(package-selected-packages
   '(use-package helm-ag powerline-evil youdao-dictionary window-numbering which-key tramp-term smartparens powerline popwin org-bullets monokai-theme keyfreq js2-mode iedit hungry-delete flycheck evil-surround evil-nerd-commenter evil-leader evil-escape counsel company chinese-fonts-setup auto-yasnippet auto-dictionary))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Monospaced" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(lsp-ui-doc-background ((t (:background nil))))
 '(lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic))))))

(provide 'init-custom)
