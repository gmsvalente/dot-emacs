;;; init.el --- init file -*- lexical-binding: t; -*-

;; CopyWhat? (©?) 2022 Gustavo Valente

;; Author: Gustavo Valente <gustavomsvalente@gmail.com>
;; Maintainer: Gustavo Valente <gustavomsvalente@gmail.com>
;; Version: 0.0.1

;;; Commentary:
;;  init and start process for config.el

;;; Code:

(message "-------------------------")
(message "---| Loading init.el |---")
(message "-------------------------")

;;; set custom-file.el
(defvar custom-file-path (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file-path)
  (setq custom-file custom-file-path)
  (load custom-file))

;;; disable on startup
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; set the config-file to be load by babel
(defvar config-file (expand-file-name "config.org" user-emacs-directory))

;;; include melpa to package-archives
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;;; verify use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'org)
(require 'ob-clojure)

(when (file-exists-p config-file)
  (org-babel-load-file config-file))

(provide 'init)

;; (setq visible-bell t)
;; (line-number-mode +1)
;; (column-number-mode +1)

;; (require 'package)

;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; (package-initialize)

;; (defun paredit-hook-fn ()
;;    (paredit-mode 1))

;; (use-package paredit
;;   :ensure t
;;   :config
;;   (autoload 'enable-paredit-mode "paredit")
;;   :hook ((lisp-mode emacs-lisp-mode) . enable-paredit-mode))
;;
;;
;;
;; (let ((pkg-list '(use-package package exec-path-from-shell)))
;;   (dolist (pkg pkg-list)
;;     (message (format "looking for %s" pkg))
;;     (if (package-installed-p pkg)
;; 	(message (format "%s installed" pkg))
;;       (message (format "%s not installed" pkg)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
