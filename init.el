(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)
; (package-refresh-contents)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/custom/colorthemes"))


(setq gc-cons-threshold 100000000)

(defconst required-packages
  '(helm
    helm-swoop
    flycheck
    yasnippet
    elpy
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

(load-theme 'dark-laptop t t)
(enable-theme 'dark-laptop)

(require 'setup-helm)
(require 'yasnippet)
(yas-global-mode 1)

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

;; To use arrows to jump between windows
(when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))

;; Show matching parens:
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Show line numbers
(global-linum-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum-format (quote "%4d "))
 '(package-selected-packages
   (quote
    (elpy yasnippet flycheck))))

(elpy-enable)

(electric-indent-mode 0)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
