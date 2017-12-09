(require 'package)

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'custom-theme-load-path "~/.emacs.d/custom/emacs-color-theme-solarized")

(defconst required-packages
  '(helm
    helm-swoop
    helm-gtags
    helm-cscope
    clang-format
    ))

;(load-theme 'solarized t)

(global-set-key (kbd "C-x f") 'clang-format-buffer)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style) ;; load google style for c-mode
(add-hook 'c-mode-common-hook 'google-make-newline-indent) ;; automatically indent at newline

;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "\C-cg")

(require 'setup-helm)
(require 'setup-helm-gtags)

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

;; Show line numbers
;(global-linum-mode t)
(custom-set-variables '(linum-format (quote "%4d ")))
