;;; mail-config.el --- my mail config using not much
;;; Commentary:

;;; Code:

(use-package notmuch
  :demand t
  :init
  (setq notmuch-search-sort-order 'newest-first))

(setq send-mail-function 'sendmail-send-it
      sendmail-program "/usr/bin/msmtp"
      mail-specify-envelope-from t
      message-sendmail-envelope-from 'header
      mail-envelope-from 'header)

(provide 'mail-config)
;;; mail-config.el ends here
