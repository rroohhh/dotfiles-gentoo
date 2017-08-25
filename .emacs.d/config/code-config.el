;;; code-config.el --- general coding config
;;; Commentary:

;;; Code:

(use-package yasnippet
  :demand
  :diminish yas-minor-mode
  :config
  (yas-global-mode)
  (setq yas-triggers-in-field t))

(use-package flycheck
  :demand
  :diminish flycheck-mode
  :config
  (global-flycheck-mode))

(use-package smartparens-config
  :demand
  :diminish smartparens-mode
  :ensure smartparens
  :config
  (add-hook 'prog-mode-hook #'smartparens-mode))

(use-package smart-comment
  :demand
  :bind ("M-;" . smart-comment))

(use-package hideshow
  :demand
  :diminish hs-minor-mode
  ;; :bind ("<C-tab>" . hs-toggle-hiding)
  :config
  ;; evil hack, because hideshow sucks
  (evil-define-key 'normal global-map (kbd "öf") (lambda () (interactive) (hs-toggle-hiding)))
  (add-hook 'prog-mode-hook 'hs-minor-mode))

(use-package iedit
  :demand
  :bind ("<C-;>" . iedit-mode))

(use-package evil-iedit-state
  :demand
  :bind ("<C-,>" . evil-iedit-state/iedit-mode))

(use-package rainbow-delimiters
  :demand
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package cmake-mode
  :demand
  :init
  (setq auto-mode-alist
		(append
		 '(("CMakeLists\\.txt\\'" . cmake-mode))
		 '(("\\.cmake\\'" . cmake-mode))
		 auto-mode-alist)))

(use-package json-reformat
  :demand)

	;; "Copyright (C) "(format-time-string "%Y")" by "(skeleton-read "Owner? ")". All Rights Reserved." \n
(auto-insert-mode)
(define-auto-insert
  '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C++ skeleton")
  '("Short description: "
	"/*" \n
	"Copyright (C) "(format-time-string "%Y")" by Robin Heinemann. All Rights Reserved." \n
	(file-name-nondirectory (buffer-file-name))
	" -- " (skeleton-read "Short description: ") \n
	" */" > \n \n
	"#include \""(file-name-sans-extension (file-name-nondirectory (buffer-file-name)))".h\"" \n \n \n))
(define-auto-insert
  '("\\.\\([Hh]\\|hh\\|hpp\\)\\'" . "C++ header skeleton")
  '("Short description: "
	"/*" \n
	"Copyright (C) "(format-time-string "%Y")" by Robin Heinemann. All Rights Reserved." \n
	(file-name-nondirectory (buffer-file-name))
	" -- " (skeleton-read "Short description: ") \n
	" */" > \n \n
	"#ifndef __"(upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))"_H_"\n
	"#define __"(upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))"_H_"\n \n
	> _ \n \n
	"#endif"))

(global-set-key (kbd "<f6>") 'next-error)

(electric-pair-mode 1)
(add-to-list 'electric-pair-pairs '(?\$ . ?\$))

(global-prettify-symbols-mode)
(setq prettify-symbols-unprettify-at-point t)
(setq-default indent-tabs-mode nil)

(provide 'code-config)
;;; code-config.el ends here
