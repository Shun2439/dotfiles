(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; ~/.emacs.dから読み出す
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

