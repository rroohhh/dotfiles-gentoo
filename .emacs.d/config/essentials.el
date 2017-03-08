;;; essentials.el --- some essential packages
;;; Commentary:

;;; Code:

;; remove trailing whitespace
(use-package ws-butler
  :demand
  :diminish ws-butler-mode
  :config
  (ws-butler-global-mode))



;; undo-tree
(use-package undo-tree
  :demand undo-tree-mode
  :diminish undo-tree-mode
  :init (setq undo-tree-visualizer-diff t)
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist
		`(("." . ,(concat "/home/robin/.cache/" "undo"))))
  :config
  (global-undo-tree-mode))

;; hungry delete
(use-package hungry-delete
  :demand
  :diminish hungry-delete-mode
  :config
  (global-hungry-delete-mode 1))

(use-package fancy-battery
  :demand
  :config
  (add-hook 'after-init-hook #'fancy-battery-mode))

(provide 'essentials)
;;; essentials.el ends here
