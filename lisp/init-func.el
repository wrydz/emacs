;;; init-func --- Summary
;;; Commentary:

;;; Code:
;; 隐藏dos的换行符\M
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; 删除dos下的换行符\M
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR."
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun alternate-buffer (&optional window)
  "Switch back and forth between current and last buffer in the current WINDOW."
  (interactive)
  (let ((current-buffer (window-buffer window))
        (buffer-predicate
         (frame-parameter (window-frame window) 'buffer-predicate)))
    ;; switch to first buffer previously shown in this window that matches
    ;; frame-parameter `buffer-predicate'
    (switch-to-buffer
     (or (cl-find-if (lambda (buffer)
                       (and (not (eq buffer current-buffer))
                            (or (null buffer-predicate)
                                (funcall buffer-predicate buffer))))
                     (mapcar #'car (window-prev-buffers window)))
         ;; `other-buffer' honors `buffer-predicate' so no need to filter
         (other-buffer current-buffer t)))))


;; create temporary file in workspace
(defun create-work-temp-file (&optional name-or-suffix)
  "Create new file in work dir, you can input file suffix or filename.  NAME-OR-SUFFIX."
  (interactive "sPlease input file name or suffix : ")
  (progn
    (setq work-dir-name "/home/wrydz/Work/worklog")
    (cond ((string= "" (string-trim name-or-suffix))
           (setq temp-file-name (get-work-file-name-not-exists work-dir-name "log")))
          ((string= "." (substring name-or-suffix 0 1))
           (setq temp-file-name (get-work-file-name-not-exists work-dir-name (substring name-or-suffix 1))))
          (t
           (setq temp-file-name (concat work-dir-name "/" name-or-suffix))))
    (find-file temp-file-name)
    ))


(defun get-work-file-name-not-exists(work-dir-name suffix)
  "Get a file name not exists."
  (let ((work-temp-file (concat-work-temp-file-name work-dir-name 1 suffix))
	(index 1))
    (while (file-exists-p work-temp-file)
      (setq work-temp-file (concat-work-temp-file-name work-dir-name (1+ index) suffix)))
    (setq fullname work-temp-file)
      ))

(defun concat-work-temp-file-name (work-dir-name index suffix)
  "Concat a string of file."
  (concat work-dir-name "/" (format-time-string "%Y%m%d") "_temp_" (int-to-string index) "." suffix))


(provide 'init-func)
;;; init-func.el ends here
