;;; init-ui.el --- Summary:
;;; Commentary:


;;; Code:
;; 高亮光标所在行
(global-hl-line-mode t)

;; 编程模式显示行号
(add-hook 'prog-mode-hook 'linum-mode)

;; 隐藏滚动条，工具栏，菜单栏
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; 在modelline显示时间和日期
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-format "%m-%d %A %H:%M")
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

;; 关闭启动画面
(setq inhibit-splash-screen t)

;; Change cursor style
(setq-default cursor-type 'bar)

;; 启动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 设置字体
(use-package cnfonts
  :config
  (cnfonts-enable))


(use-package all-the-icons
  :ensure t)

(use-package powerline
  :config
  (powerline-default-theme))

(provide 'init-ui)
;;; init-ui.el ends here
