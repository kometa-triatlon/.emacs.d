;;; setup-company --- Setup script for company-mode
;;; Commentary:
;;; -*- Mode: Emacs-Lisp -*-
;;


(require 'company)

;;; Code:
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)

(setq company-idle-delay 0)


; configure backends
(require 'company-irony)
(require 'company-c-headers)

(add-to-list 'company-c-headers-path-system "/usr/include/")
(add-to-list 'company-c-headers-path-system "/usr/local/include/")
(add-to-list 'company-c-headers-path-system "/usr/local/include/c++/5.2.0")
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8")

(add-to-list 'company-c-headers-path-system "/usr/include/qt5")
(add-to-list 'company-c-headers-path-system "/usr/include/qt5/QtCore")
(add-to-list 'company-c-headers-path-system "/usr/include/qt5/QtNetwork")
(add-to-list 'company-c-headers-path-system "/usr/include/qt5/QtTest")

(eval-after-load 'company '(setq company-backends nil))
(eval-after-load 'company '(add-to-list 'company-backends 'company-irony))
(eval-after-load 'company '(add-to-list 'company-backends 'company-files))
(eval-after-load 'company '(add-to-list 'company-backends 'company-c-headers))
(eval-after-load 'company '(add-to-list 'company-backends 'company-xcode))
(eval-after-load 'company '(add-to-list 'company-backends 'company-elisp))


(provide 'setup-company)
;;; setup-company.el ends here
