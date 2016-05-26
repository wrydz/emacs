(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 隐藏dos的换行符\M
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; 删除dos下的换行符\M
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; open gtd file
(defun open-my-gtd-file ()
  (interactive)
  (find-file "e:/GTD/tasks.org"))

(provide 'init-func)
