;; 高亮当前行
(global-hl-line-mode t)

(add-hook 'prog-mode-hook 'linum-mode)

;; Hide tool bar,scroll bar and Show line number
(scroll-bar-mode -1)
(tool-bar-mode -1)
;; (global-linum-mode t)
;; 关闭启动画面
(setq inhibit-splash-screen t)

;; Change cursor style
(setq-default cursor-type 'bar)

;; 全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(provide 'init-ui)
