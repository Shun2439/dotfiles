(global-display-line-numbers-mode 1)

(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Orgを追加
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; 初期化
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(atom-one-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; color theme
;; <https://github.com/jonathanchu/atom-one-dark-theme>
(load-theme 'atom-one-dark t)

;; <https://gihyo.jp/admin/serial/01/ubuntu-recipe/0175>
(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)

;; (setq skk-large-jisyo "C:\Users\%USERPROFILE%\AppData\Local\nvim-data\SKK-JISYO.L)
(setq skk-large-jisyo "/home/$USER/SKK-JISYO.L")

(setq user-mail-address "shunta.kobayashi24@gmail.com")
(setq user-full-name "Kobayashi Shunta")
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq mail-user-agent 'message-user-agent)
(setq message-send-mail-function 'message-smtpmail-send-it)
