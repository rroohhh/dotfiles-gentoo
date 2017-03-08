;;; packages --- loads all required packages
;;; Commentary:
;;; Code:

(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(provide 'packages)
;;; packages.el ends here
