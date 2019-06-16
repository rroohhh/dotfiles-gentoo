;;; company-config.el --- company config
;;; Commentary:

;;; Code:
(use-package company
  :demand
  :diminish company-mode
  :init
  ;; (setq company-idle-delay 0)
  :config
  (setq company-tooltip-align-annotations t)
  (global-company-mode 1)
  (global-set-key (kbd "<C-return>") 'company-complete)
  (add-hook 'after-init-hook (lambda ()
							   (add-to-list 'company-backends 'company-elisp)
							   (setq company-begin-commands t)
							   (setq company-idle-delay 0))))


(use-package company-try-hard
  :demand
  :config
  (global-set-key (kbd "C-z") 'company-try-hard))

(use-package company-statistics
  :demand
  :init
  (setq company-statistics-auto-save t)
  :config
  (add-hook 'after-init-hook 'company-statistics-mode))

(use-package company-tern
  :demand
  :config
  (add-to-list 'company-backends 'company-tern))

(provide 'company-config)
;;; company-config.el ends here
