(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; The value of this variable is the number of bytes of storage
;; that must be allocated for Lisp objects after one garbage collection
;; in order to trigger another garbage collection
(setq gc-cons-threshold 100000000)

(defconst required-packages
  '(ecb
    yasnippet
    google-c-style
    ))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package required-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)


(require 'ecb)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-layout-name "left3"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'yasnippet)
(yas-global-mode 1)


(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style) ;; load google style for c-mode
(add-hook 'c-mode-common-hook 'google-make-newline-indent) ;; automatically indent at newline


;; Use space to indent by default
(setq-default indent-tabs-mode nil)

;; Show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; Do not create backup files
(setq make-backup-files nil)

;; Set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Display column number
(setq column-number-mode t)

;; Flash instead of that annoying bell
(setq visible-bell t)

;; Scroll line by line
(setq scroll-step 1)

;; Treat .h files as c++ files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; To use arrows to jump between windows
(when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))

;; Show matching parens:
(show-paren-mode 1)
(setq show-paren-delay 0)