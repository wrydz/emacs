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

;; 字体设置
;; 该函数分别传入 英文字体名 中文字体名 英文字体大小 中文字体大小
;; 通常中文比英文字体号大2时，两个字体等宽
(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

(set-font "Source Code Pro" "Hiragino Sans GB" 14 16)
;; (set-font   "Source Code Pro" "WenQuanYi Zen Hei Mono" 14 16)

(provide 'init-ui)
