; -*- emacs-lisp -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)
(package-install 'company)
(package-install 'ggtags)
(package-install 'yasnippet)
(package-install 'undo-tree)
(package-install 'company-c-headers)
(package-install 'company-quickhelp)
(package-install 'company-irony)
(package-install 'flycheck)
(package-install 'flycheck-irony)
(package-install 'guide-key)
; (package-install 'helm)
; (package-install 'helm-company)
(package-install 'irony)
(package-install 'nyan-mode)
(package-install 'popwin)
(package-install 'molokai-theme)

;emacs -Q --batch \
;--eval '(require '\''package)' \
;--eval '(add-to-list '\''package-archives '\''("melpa" . "https://melpa.org/packages/"))' \
;--eval '(package-initialize)' \
;--eval '(package-refresh-contents)' \
;--eval '(package-install '\''ggtags)' \
;--eval '(package-install '\''company)' \
;--eval '(package-install '\''company-quickhelp)' \
;--eval '(package-install '\''yasnippet)' \
;--eval '(package-install '\''irony)' \
;--eval '(package-install '\''flycheck)'
