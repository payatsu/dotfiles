;;; init.el --- my init.el
;;; Commentary:
;;; my init.el

; *** Basic color settings ***
(defvar fgcolor "white")
(defvar bgcolor "black")
(defvar curcolor "DodgerBlue2")
(defvar hlbgcolordark "MediumPurple4")
(defvar hlbgcolorlight "LightSkyBlue1")
(defvar regioncolor "royal blue")
(defvar mousecolor "DeepSkyBlue4")
(defvar grayoutcolor "gray20")
(if window-system (add-to-list 'default-frame-alist (cons 'foreground-color fgcolor)))
(if window-system (add-to-list 'default-frame-alist (cons 'background-color bgcolor)))
(add-to-list 'default-frame-alist (cons 'cursor-color curcolor))
(setq hl-line-face 'my-hl-line)
(defface my-hl-line (list
					 (list '((class color)(background dark))
						   (list ':background hlbgcolordark))
					 (list '((class color)(background light))
						   (list ':background hlbgcolorlight))
					 '(t())) "*Face used by hl-line." :group 'hl-line)
(set-face-background 'region regioncolor)
(add-to-list 'default-frame-alist (cons 'mouse-color mousecolor))
(if window-system (add-to-list 'default-frame-alist '(alpha . 90)))
;(set-face-foreground 'modeline "white")
;(set-face-background 'modeline "forest green")

; *** Misc settings ***
(setq display-time-day-and-date t)
(setq display-time-format "%F %T")
(setq display-time-default-load-average nil)
(setq display-time-interval 1)
(display-time-mode 1)
(column-number-mode 1)
(line-number-mode 1)
(menu-bar-mode -1)
(when window-system (tool-bar-mode -1) (scroll-bar-mode -1))
(show-paren-mode 1)
(electric-pair-mode 1)
(electric-indent-mode 1)
(delete-selection-mode 1)
(icomplete-mode 1)
(winner-mode 1)
(which-function-mode 1)
(eldoc-mode 1)
(savehist-mode 1)
(set-frame-font "Ricty 14" nil t)
(setq scroll-conservatively 1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq frame-title-format '("%b - " invocation-name "@" system-name))
(setq make-backup-files nil)
(setq-default truncate-lines t)
(setq-default case-fold-search nil)
(setq-default tab-width 4)
(setq mouse-wheel-scroll-amount '(1((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(if (string= default-directory "/") (cd "~"))
(setq x-select-enable-clipboard-manager nil)
(add-to-list 'auto-mode-alist '("\\.txt$" . outline-mode))
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "<C-tab>") 'switch-to-next-buffer)
(global-set-key (kbd "<C-iso-lefttab>") 'switch-to-prev-buffer)
(global-set-key "\C-c\C-n" 'next-buffer)
(global-set-key "\C-c\C-p" 'previous-buffer)
(global-set-key "\C-c\M-n" 'winner-redo)
(global-set-key "\C-c\M-p" 'winner-undo)
(global-set-key (kbd "<C-triple-mouse-4>") '(lambda () (interactive) (text-scale-adjust 1)))
(global-set-key (kbd "<C-triple-mouse-5>") '(lambda () (interactive) (text-scale-adjust -1)))
(global-set-key (kbd "<C-wheel-up>") '(lambda () (interactive) (text-scale-adjust 1)))
(global-set-key (kbd "<C-wheel-down>") '(lambda () (interactive) (text-scale-adjust -1)))
(global-set-key "\C-cc" 'compile)
(global-set-key "\C-cj" 'comment-region)
(global-set-key "\C-cm" 'uncomment-region)
(global-set-key "\C-ct" 'complete-symbol)
(global-linum-mode t)
(global-hl-line-mode t)
(global-auto-revert-mode 1)
(global-subword-mode 1)
(global-cwarn-mode 1)
(global-prettify-symbols-mode 1)
(autoload 'dired "dired-x" nil t)
(autoload 'dired "wdired" nil t)
(require 'server)
(unless (server-running-p) (server-start))
(require 'saveplace)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

; *** Hi-lock-mode ***
(global-hi-lock-mode 1)
(setq hi-lock-file-patterns-policy t)
(defface grayout (list
				  (list '((class color)(background dark)) (list ':foreground grayoutcolor))
				  (list '((class color)(background light)) (list ':foreground grayoutcolor))
				  '(t())) "Face for '前記'" :group 'highlight)
(defface todo (list
			   (list '((class color)(background dark)) (list ':weight 'ultra-bold ':foreground "deep sky blue" ':underline t))
			   (list '((class color)(background light)) (list ':weight 'ultra-bold ':foreground "deep sky blue" ':underline t))
			   '(t())) "Face for todo" :group 'highlight)
(defface fixme (list
				(list '((class color)(background dark)) (list ':weight 'ultra-bold ':foreground fgcolor ':background "red" ':box t))
				(list '((class color)(background light)) (list ':weight 'ultra-bold ':foreground fgcolor ':background "red" ':box t))
				'(t())) "Face for fixme" :group 'highlight)
(defface xxx (list
			  (list '((class color)(background dark)) (list ':weight 'ultra-bold ':foreground "goldenrod1" ':underline t))
			  (list '((class color)(background light)) (list ':weight 'ultra-bold ':foreground "goldenrod1" ':underline t))
			  '(t())) "Face for xxx" :group 'highlight)
(defface caption (list
				  (list '((class color)(background dark)) (list ':weight 'ultra-bold ':underline t))
				  (list '((class color)(background light)) (list ':))
				  '(t())) "Face for 【caption】, 〈caption〉, 《caption》, ＜caption＞, ≪caption≫" :group 'highlight)
(defface star (list
			   (list '((class color)(background dark)) (list ':foreground "gold" ':weight 'extra-bold))
			   (list '((class color)(background light)) (list ':foreground "gold" ':weight 'extra-bold))
			   '(t())) "Face for ☆★" :group 'highlight)
(defface circle (list
				 (list '((class color)(background dark)) (list ':foreground "red" ':weight 'extra-bold))
				 (list '((class color)(background light)) (list ':foreground "red" ':weight 'extra-bold))
				 '(t())) "Face for ○●◎" :group 'highlight)
(defface square (list
				 (list '((class color)(background dark)) (list ':foreground "violet" ':weight 'extra-bold))
				 (list '((class color)(background light)) (list ':foreground "violet" ':weight 'extra-bold))
				 '(t())) "Face for □■" :group 'highlight)
(defface diamond (list
				  (list '((class color)(background dark)) (list ':foreground "forest green" ':weight 'extra-bold))
				  (list '((class color)(background light)) (list ':foreground "forest green" ':weight 'extra-bold))
				  '(t())) "Face for ◇◆" :group 'highlight)
(defface triangle (list
				   (list '((class color)(background dark)) (list ':foreground "firebrick" ':weight 'extra-bold))
				   (list '((class color)(background light)) (list ':foreground "firebrick" ':weight 'extra-bold))
				   '(t())) "Face for △▲" :group 'highlight)
(defface down-triangle (list
						(list '((class color)(background dark)) (list ':foreground "RoyalBlue" ':weight 'extra-bold))
						(list '((class color)(background light)) (list ':foreground "RoyalBlue" ':weight 'extra-bold))
						'(t())) "Face for ▽▼" :group 'highlight)
(defface enclosed-number (list
						  (list '((class color)(background dark)) (list ':foreground "deep pink" ':weight 'extra-bold))
						  (list '((class color)(background light)) (list ':foreground "deep pink" ':weight 'extra-bold))
						  '(t())) "Face for ①②③④⑤⑥⑦⑧⑨" :group 'highlight)
(defface note (list
			   (list '((class color)(background dark)) (list ':foreground "black" ':background "yellow" ':weight 'extra-bold))
			   (list '((class color)(background light)) (list ':foreground "black" ':backeground "yellow"':weight 'extra-bold))
			   '(t())) "Face for ※" :group 'highlight)
(defface line3-rule (list
					 (list '((class color)(background dark)) (list ':foreground "yellow" ':underline t))
					 (list '((class color)(background light)) (list ':foreground "yellow" ':underline t))
					 '(t())) "Face for over 40x3 chars" :group 'highlight)
(add-hook 'find-file-hook
		  '(lambda ()
			 (highlight-phrase "前記\\|該" 'grayout)
			 (highlight-phrase "todo\\|TODO\\|ToDo" 'todo)
			 (highlight-phrase "fixme\\|FIXME" 'fixme)
			 (highlight-phrase "xxx\\|XXX" 'xxx)
			 (highlight-phrase "【[^】]*】\\|〈[^〉]*〉\\|《[^》]*》\\|＜[^＞]*＞\\|≪[^≫]*≫" 'caption)
			 (highlight-phrase "☆\\|★" 'star)
			 (highlight-phrase "○\\|●\\|◎" 'circle)
			 (highlight-phrase "□\\|■" 'square)
			 (highlight-phrase "◇\\|◆" 'diamond)
			 (highlight-phrase "△\\|▲" 'triangle)
			 (highlight-phrase "▽\\|▼" 'down-triangle)
			 (highlight-phrase "①\\|②\\|③\\|④\\|⑤\\|⑥\\|⑦\\|⑧\\|⑨" 'enclosed-number)
			 (highlight-phrase "※.*" 'note)
			;(highlight-phrase "^.*\\Ca\\{120,\\}。" 'line3-rule)
			 ) t)
(defface hi01 (list
			   (list '((class color)(background light)) (list ':foreground "firebrick1"))
			   (list '((class color)(background dark)) (list ':foreground "firebrick1"))
			   '(t())) "Face for highlight 01" :group 'highlight)
(defface hi02 (list
			   (list '((class color)(background light)) (list ':foreground "dodger blue"))
			   (list '((class color)(background dark)) (list ':foreground "dodger blue"))
			   '(t())) "Face for highlight 02" :group 'highlight)
(defface hi03 (list
			   (list '((class color)(background light)) (list ':foreground "lime green"))
			   (list '((class color)(background dark)) (list ':foreground "lime green"))
			   '(t())) "Face for highlight 03" :group 'highlight)
(defface hi04 (list
			   (list '((class color)(background light)) (list ':foreground "purple"))
			   (list '((class color)(background dark)) (list ':foreground "purple"))
			   '(t())) "Face for highlight 04" :group 'highlight)
(defface hi05 (list
			   (list '((class color)(background light)) (list ':foreground "orange"))
			   (list '((class color)(background dark)) (list ':foreground "orange"))
			   '(t())) "Face for highlight 05" :group 'highlight)
(defface hi06 (list
			   (list '((class color)(background light)) (list ':foreground "VioletRed1"))
			   (list '((class color)(background dark)) (list ':foreground "VioletRed1"))
			   '(t())) "Face for highlight 06" :group 'highlight)
(defface hi07 (list
			   (list '((class color)(background light)) (list ':foreground "sky blue"))
			   (list '((class color)(background dark)) (list ':foreground "sky blue"))
			   '(t())) "Face for highlight 07" :group 'highlight)
(defface hi08 (list
			   (list '((class color)(background light)) (list ':foreground "SeaGreen1"))
			   (list '((class color)(background dark)) (list ':foreground "SeaGreen1"))
			   '(t())) "Face for highlight 08" :group 'highlight)
(defface hi09 (list
			   (list '((class color)(background light)) (list ':foreground "hot pink"))
			   (list '((class color)(background dark)) (list ':foreground "hot pink"))
			   '(t())) "Face for highlight 09" :group 'highlight)
(defface hi10 (list
			   (list '((class color)(background light)) (list ':foreground "light goldenrod"))
			   (list '((class color)(background dark)) (list ':foreground "light goldenrod"))
			   '(t())) "Face for highlight 10" :group 'highlight)
(defface rev01 (list
			   (list '((class color)(background light)) (list ':foreground "black" ':background "firebrick1"))
			   (list '((class color)(background dark)) (list ':foreground "black" ':background "firebrick1"))
			   '(t())) "Face for reverse 01" :group 'highlight)
(defface rev02 (list
			   (list '((class color)(background light)) (list ':foreground "black" ':background "dodger blue"))
			   (list '((class color)(background dark)) (list ':foreground "black" ':background "dodger blue"))
			   '(t())) "Face for reverse 02" :group 'highlight)
(defface rev03 (list
			   (list '((class color)(background light)) (list ':foreground "black" ':background "lime green"))
			   (list '((class color)(background dark)) (list ':foreground "black" ':background "lime green"))
			   '(t())) "Face for reverse 03" :group 'highlight)
(defface rev04 (list
			   (list '((class color)(background light)) (list ':foreground "black" ':background "purple"))
			   (list '((class color)(background dark)) (list ':foreground "black" ':background "purple"))
			   '(t())) "Face for reverse 04" :group 'highlight)
(defface rev05 (list
			   (list '((class color)(background light)) (list ':foreground "black" ':background "orange"))
			   (list '((class color)(background dark)) (list ':foreground "black" ':background "orange"))
			   '(t())) "Face for reverse 05" :group 'highlight)
(defface rev06 (list
			   (list '((class color)(background light)) (list ':foreground "black" ':background "VioletRed1"))
			   (list '((class color)(background dark)) (list ':foreground "black" ':background "VioletRed1"))
			   '(t())) "Face for reverse 06" :group 'highlight)
(defface rev07 (list
			   (list '((class color)(background light)) (list ':foreground "black" ':background "sky blue"))
			   (list '((class color)(background dark)) (list ':foreground "black" ':background "sky blue"))
			   '(t())) "Face for reverse 07" :group 'highlight)
(defface rev08 (list
			   (list '((class color)(background light)) (list ':foreground "black" ':background "SeaGreen1"))
			   (list '((class color)(background dark)) (list ':foreground "black" ':background "SeaGreen1"))
			   '(t())) "Face for reverse 08" :group 'highlight)
(defface rev09 (list
			   (list '((class color)(background light)) (list ':foreground "black" ':background "hot pink"))
			   (list '((class color)(background dark)) (list ':foreground "black" ':background "hot pink"))
			   '(t())) "Face for reverse 09" :group 'highlight)
(defface rev10 (list
			   (list '((class color)(background light)) (list ':foreground "black" ':background "light goldenrod"))
			   (list '((class color)(background dark)) (list ':foreground "black" ':background "light goldenrod"))
			   '(t())) "Face for reverse 10" :group 'highlight)
(setq hi-lock-face-defaults
	  '("rev01" "rev02" "rev03" "rev04" "rev05" "rev06" "rev07" "rev08" "rev09" "rev10"
		"hi01" "hi02" "hi03" "hi04" "hi05" "hi06" "hi07" "hi08" "hi09" "hi10"
		))

; *** theme ***
(if (locate-file "molokai-theme.el" (custom-theme--load-path) '("" "c")) (load-theme 'molokai t))

; *** whitespace-mode ***
(if window-system
	(progn
	  (global-whitespace-mode 1)
	  (setq whitespace-style
			'(face trailing tabs spaces newline empty line-trail
				   indentation space-after-tab space-before-tab
				   space-mark tab-mark newline-mark))
	  (setq whitespace-display-mappings
			'((space-mark 32 [183] [46])
			  (space-mark 160 [164] [95])
			  (newline-mark 10 [8595 10])
			  (tab-mark 9 [187 9] [92 9])))
	  (set-face-attribute 'whitespace-empty nil
						  :background "none")
	  (set-face-attribute 'whitespace-indentation nil
						  :foreground grayoutcolor
						  :background "none")
	  (set-face-attribute 'whitespace-space nil
						  :foreground grayoutcolor
						  :background "none")
	  (set-face-attribute 'whitespace-tab nil
						  :foreground grayoutcolor
						  :background "none")
	  (set-face-attribute 'whitespace-newline nil
						  :foreground "SeaGreen1")
	  (set-face-attribute 'whitespace-line nil
						  :foreground "red"
						  :background "none"
						  :underline t)
))
; *** Diff-mode ***
(add-hook 'diff-mode-hook '(lambda () (progn
(set-face-attribute 'diff-changed nil
					:weight 'bold
					)
(set-face-attribute 'diff-added nil
					:foreground "black"
					:background "pale green"
					)
(set-face-attribute 'diff-removed nil
					:foreground "black"
					:background "orchid1"
					)
(set-face-attribute 'diff-refine-changed nil
					:underline t
					:background "yellow"
					)
(set-face-attribute 'diff-indicator-changed nil
					:weight 'ultra-bold
					)
(set-face-attribute 'diff-indicator-added nil
					:background "green"
					)
(set-face-attribute 'diff-indicator-removed nil
					:background "red"
					)
;(set-face-attribute 'diff-refine-added nil
;					)
;(set-face-attribute 'diff-refine-removed nil
;					)
;(set-face-attribute 'diff-nonexistent nil
;					)
;(set-face-attribute 'diff-header nil
;					:background "medium purple"
;					)
;(set-face-attribute 'diff-file-header nil
;					:background "RoyalBlue1"
;					)
;(set-face-attribute 'diff-hunk-header nil
;					:foreground "black"
;					:background "cornflower blue"
;					)
;(set-face-attribute 'diff-function nil
;					)
;(set-face-attribute 'diff-index nil
;					)
)))
(add-hook 'diff-mode-hook '(lambda () (diff-auto-refine-mode t)))

; *** system C/C++ include path ***
(defconst include-path "/usr/local/include")
(defconst include-path-c++ "/usr/local/include/c++/6.2.0")
(defconst include-path2 "/toolchains/include")
(defconst include-path-c++2 "/toolchains/include/c++/6.2.0")

; *** Semantic-mode ***
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
;;;;;;;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(setq semantic-stickyfunc-sticky-classes '(function type variable include package))
(require 'semantic/ia)
(require 'semantic/bovine/gcc)
(semantic-add-system-include include-path)
(semantic-add-system-include include-path-c++ 'c++-mode)
(semantic-add-system-include include-path2)
(semantic-add-system-include include-path-c++2 'c++-mode)
(add-hook 'prog-mode-hook '(lambda () (semantic-mode 1)))

; *** undo-tree-mode ***
(if (require 'undo-tree nil t) (global-undo-tree-mode 1))

; *** company-mode ***
(when (require 'company nil t)
  (global-company-mode 1)
  (setq company-idle-delay 2)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  (add-to-list 'company-backends 'company-c-headers)
  (with-eval-after-load "company"
	'(lambda () (add-to-list 'company-c-headers-path-system include-path-c++)))
  (global-set-key (kbd "C-M-i") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection)
  (set-face-attribute 'company-tooltip nil
					  :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common nil
					  :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common-selection nil
					  :foreground "white" :background "steelblue")
  (set-face-attribute 'company-tooltip-selection nil
					  :foreground "black" :background "steelblue")
  (set-face-attribute 'company-preview-common nil
					  :background nil :foreground "lightgrey" :underline t)
  (set-face-attribute 'company-scrollbar-fg nil
					  :background "orange")
  (set-face-attribute 'company-scrollbar-bg nil
					  :background "gray40")
)

; *** irony-mode ***
(when (require 'irony nil t)
  (with-eval-after-load "irony"
	(custom-set-variables '(irony-additional-clang-options '("-std=c++11")))
	(add-to-list 'company-backends 'company-irony)
	(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
	(add-hook 'c-mode-common-hook 'irony-mode))
)

; *** yasnippet-mode ***
(when (require 'yasnippet nil t)
  (yas-global-mode t)
  (with-eval-after-load "yasnippet"
	(define-key yas-keymap (kbd "<tab>") nil)
	(yas-global-mode 1))
)

; *** flycheck-mode ***
(when (require 'flycheck nil t)
  (global-flycheck-mode 1)
  (flycheck-irony-setup)
  (add-hook 'c++-mode-hook '(setq flycheck-gcc-language-standard "c++11"))
)

; *** ggtags-mode ***
(if (require 'ggtags nil t)
	(add-hook 'c-mode-common-hook '(lambda () (ggtags-mode 1))))

; *** Helm-mode ***
(when (require 'helm-config nil t)
  (helm-mode 1)
  (define-key global-map (kbd "M-x") 'helm-M-x)
;  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x b") 'helm-buffers-list)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-find-files-map (kbd "C-j") 'helm-select-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "C-j") 'helm-select-action)
  )

; *** popwin ***
;(when (require 'popwin nil t)
;  (setq display-buffer-function 'popwin:display-buffer))

; *** nyan-mode ***
(if (require 'nyan-mode nil t) (nyan-mode 1))

(when (require 'guide-key nil t)
  (setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
  (guide-key-mode 1))

; *** gdb-mode ***
(setq gdb-many-windows t)

; *** mode hooks ***
(add-hook 'c-mode-common-hook '(lambda () (c-set-style "cc-mode")))
(add-hook 'html-mode-hook '(lambda () (setq sgml-basic-offset 1)))
(add-hook 'python-mode-hook '(lambda () (setq indent-tabs-mode t) (setq indent-level 4) (setq python-indent-offset 4) (setq tab-width 4)))

; *** gnuplot-mode ***
(autoload 'gnuplot-mode "gnuplot" nil t)
(add-to-list 'auto-mode-alist '("\\.gp$" . gnuplot-mode))

; *** LaTeX common settings ***
(add-hook 'TeX-mode-hook
		  '(lambda ()
			 (make-variable-buffer-local 'buffer-file-coding-system)
			 (setq buffer-file-coding-system 'euc-jp)))

; *** YaTeX-mode ***
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(add-to-list 'auto-mode-alist '("\\.tex$" . yatex-mode))
(setq YaTeX-kanji-code nil)
(add-hook 'yatex-mode-hook '(lambda ()
							  (auto-fill-mode -1)
							  (make-variable-buffer-local 'dvi2-command)
							  (setq dvi2-command "xdvi -geo -0+0 -s 5")
							  ))

(load "${HOME}/.emacs.d/init.local" t)
