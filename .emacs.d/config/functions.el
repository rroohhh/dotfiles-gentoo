;;; functions.el --- my functions file for emacs
;;; Commentary:

;;; Code:

(require 'helm)

;; open files as sudo
(defun sudo-find-files ()
  "Use sudo to edit files as root"
  (interactive)
  (helm-find-files-1 "/sudo::/"))

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer.")))))

(provide 'functions)
;;; functions.el ends here
