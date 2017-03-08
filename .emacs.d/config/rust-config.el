;;; rust-config.el --- rust config
;;; Commentary:

;;; Code:

(use-package rust-mode
  :ensure t
  :demand)

(use-package cargo
  :ensure t
  :demand
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  (add-hook 'rust-mode-hook (lambda ()
							  (global-set-key [remap projectile-compile-project] 'cargo-process-run)))
  (evil-define-key 'normal rust-mode-map (kbd "öö") 'rust-format-buffer))

(use-package racer
  :ensure t
  :demand
  :init
  (setq racer-cmd "/usr/bin/racer")
  (setq racer-rust-src-path "/usr/src/rustc-1.14.0/src")
  :config
  (add-hook 'rust-mode-hook 'racer-mode)
  (add-hook 'racer-mode-hook 'eldoc-mode)
  (add-hook 'racer-mode-hook 'company-mode))

(use-package flycheck-rust
  :ensure t
  :demand
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'rust-config)
;;; rust-config ends here
