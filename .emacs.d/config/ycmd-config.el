;;; ycmd-config.el --- ycmd config
;;; Commentary:

;;; Code:

(use-package ycmd
  :demand
  :init
  (set-variable 'ycmd-global-config "/home/robin/.ycm_extra_conf.py")
  (set-variable 'ycmd-server-command '("python" "/home/robin/projects/ycmd/ycmd"))
  (set-variable 'ycmd-rust-src-path "/usr/src/rustc-1.14.0/src")
  ;; (setq ycmd-force-semantic-completion nil)
  :config
  (add-hook 'after-init-hook #'global-ycmd-mode)
  (evil-define-key 'normal c-mode-base-map (kbd "ö.") 'ycmd-goto)
  (evil-define-key 'normal js-mode-map(kbd "ö.") 'ycmd-goto)
  (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)
  (set-variable ycmd-extra-conf-handler 'load))

(use-package company-ycmd
  :demand
  :config
  (company-ycmd-setup))

(use-package flycheck-ycmd
  :demand
  :config
  ;; (flycheck-select-checker 'ycmd)
  (flycheck-ycmd-setup))

  ;; (when (not (display-graphic-p))
  ;; 	(setq flycheck-indication-mode nil)))

(provide 'ycmd-config)
;;; ycmd-config.el ends here
