;;; -*- Mode: Emacs-Lisp -*-
;;


; irony
(require 'irony)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

(setq my-compile-commands-cache "~/.emacs.d/.compile_commands_cache")
(setq my-default-cdb-filename (format "%s/default.json" my-compile-commands-cache))

(defun my-irony-load-compile-commands()
  ;; To make it work correctly you should comment line
  ;;   (irony-cdb-json--save-project-alist)
  ;; in function irony-cdb-json-add-compile-commands-path from irony-cdb-json.el
  ;; Otherwise all passed to irony-cdb-json-add-compile-commands-path will be
  ;; saved in ~/.emacs.d/irony/cdb-json-projects and will all be loaded by
  ;; irony-cdb-autosetup-compile-options

  ;; Right now the compile_commands.json are looked in the same way than the
  ;; .clang_complete, it should be in parent directory of the file being edited.
  ;; To generate compile_commands.json one can use oclint-xcodebuild.

  (setq cdb-filename
        (format "%s%s.json" my-compile-commands-cache
                (file-name-sans-extension (buffer-file-name))))
  (if
      (file-exists-p cdb-filename)
      (progn
        (message (format "rc-irony: loading %s%s" "/" cdb-filename))
        (irony-cdb-json-add-compile-commands-path "/" cdb-filename)
      )
    (progn
      (message (format "rc-irony: loading %s%s" "/" my-default-cdb-filename))
      (irony-cdb-json-add-compile-commands-path "/" my-default-cdb-filename))
      )

  ;; irony-cdb-autosetup-compile-options is necessary for irony to pick up cdb.
  ;; irony-cdb-json-add-compile-commands-path is not enough - some magic?
  (irony-cdb-autosetup-compile-options))

(require 'irony-cdb-json)


;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's asynchronous function
(defun my-irony-mode-hook ()
  ;; (define-key irony-mode-map [remap completion-at-point]
  ;;   'irony-completion-at-point-async)
  ;; (define-key irony-mode-map [remap complete-symbol]
  ;;   'irony-completion-at-point-async)

  (my-irony-load-compile-commands))

(add-hook 'irony-mode-on-hook 'my-irony-mode-hook)


;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(provide 'setup-irony)
