;;; innit.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(beacon-color "pale green")
 '(custom-safe-themes
   (quote
    ("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "fd2cf9ad9895d93138dd67215702280e0db56e796ee62dea92043eed4b23177c" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "b4c13d25b1f9f66eb769e05889ee000f89d64b089f96851b6da643cee4fdab08" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" default)))
 '(doc-view-continuous t)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(inhibit-startup-screen t)
 '(org-agenda-files nil)
 '(org-src-fontify-natively t)
 '(org-src-lang-modes
   (quote
    (("jupyter-wolfram-language" . wolfram)
     ("jupyter-python" . python)
     ("C" . c)
     ("C++" . c++)
     ("asymptote" . asy)
     ("bash" . sh)
     ("beamer" . latex)
     ("calc" . fundamental)
     ("cpp" . c++)
     ("ditaa" . artist)
     ("dot" . fundamental)
     ("elisp" . emacs-lisp)
     ("ocaml" . tuareg)
     ("screen" . shell-script)
     ("shell" . sh)
     ("sqlite" . sql))))
 '(package-selected-packages
   (quote
    (ag telephone-line org-beautify-theme org-beautify wolfram-mode org-pdfview pdf-tools jupyter org ox-ipynb htmlize org-evil haskell-mode solarized emacs-solarized minted ob-ipython airline-themes smart-mode-line-powerline-theme smart-line-mode-powerline-theme emacs-powerline smart-mode-line smart-line-mode evil-surround flycheck doom-themes yasnippet-snippets delight-powerline delight diminish smooth-scrolling monokai-light-theme spacemacs-theme fill-column-indicator counsel-projectile treemacs-evil treemacs-projectile evil-magit projectile magit Magit powerline-evil monokai-theme column-marker py-autopep8 exec-path-from-shell conda yasnippet elpy better-defaults minimap linum-relative evil ein neotree expand-region hungry-delete beacon golden-ratio-scroll-screen color-theme solarized-dark-theme solarized-theme planet-theme zenburn-theme auto-complete counsel tabbar ace-window org-bullets which-key try use-package)))
 '(whitespace-global-modes (quote (not dired-mode org-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(region ((t (:background "green" :foreground "#fdf6e3")))))

;; new stuff added from tutorial


;;; Commentary:
;; 

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package try
	:ensure t)

(use-package which-key
	:ensure t
	:config
	(which-key-mode))

;; make current theme work for org mode- only works for default
(defface org-block-begin-line
  '((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
  "Face used for the line delimiting the begin of source blocks.")

(defface org-block-background
  '((t (:background "honeydew")));;#1C2833
  "Face used for the source block background.")

(defface org-block-end-line
  '((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
  "Face used for the line delimiting the end of source blocks.")

;; org mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;; add indentation
(setq org-startup-indented t)
;; take out tool bar
;; make the ... turn into better arrows
(setq org-ellipsis "⤵");; ⤵ ≫ ⚡⚡⚡ 
;; use beamer for org mode
(require 'ox-beamer)

(tool-bar-mode -1)

;; for buffers

;; using swiper so ido is no longer needed
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)
;; more ibuffer stuff from online
;; it's not working... maybe need to start from beginning
(setq ibuffer-saved-filter-groups
       (quote (("default"
                ("dired" (mode . dired-mode))
                ("org" (name . "^.*org$"))
              ("IRC" (or (mode . circe-channel-mode) (mode
              . circe-server-mode)))
                ("web" (or (mode . web-mode) (mode . js2-mode)))
                ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
                ("mu4e" (or

               (mode . mu4e-compose-mode)
               (name . "\*mu4e\*")
               ))
                ("programming" (or
                                (mode . python-mode)
                                (mode . c++-mode)
				(mode . c-mode)
				(mode . asm-mode)))
                ("emacs" (or
                          (name . "^\\*scratch\\*$")
                          (name . "^\\*Messages\\*$")))
                ))))
(add-hook 'ibuffer-mode-hook
           (lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "default")))

 ;; don't show these
;(add-to-list 'ibuffer-never-show-predicates "zowie")
 ;; Don't show filter groups if there are no buffers in that group
 (setq ibuffer-show-empty-filter-groups nil) ; make ibuffer default

;; use a tabbar
;; Yeah this was really dumb
;; (use-package tabbar
;;   :ensure t
;;   :config (tabbar-mode 1)
;;   )

;; set m-left and m-right so that they move across tabs
;;(global-set-key [M-left] 'tabbar-backward-tab)
;;(global-set-key [M-right] 'tabbar-forward-tab)

; ace window mover
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

;; swiper stuff

;; it looks like counsel is a requirement for swiper
(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ;; make it so that the search wraps
    ;; (setq ivy-wrap t)
    ;; add counsel-yank-pop
    (global-set-key (kbd "M-y") 'counsel-yank-pop)
    ))

;; avy

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;;(use-package color-theme
;;  :ensure t)

(load-theme 'solarized-light t)
;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)
;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)
;; (load-theme 'monokai)
;; gonna try out default theme again..

;; get some doom themes
(use-package doom-themes
  :ensure t
  :config
 )
;; (load-theme 'doom-nord-light)

(use-package undo-tree
:ensure t
  :init
    (global-undo-tree-mode))


;; some small packages
(global-hl-line-mode t) ;;highlight line we're on

; flashes the cursor's line when you scroll
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
; this color looks good for the zenburn theme but not for the one
; I'm using for the videos
 ;; (setq beacon-color "pale green")
)

; deletes all the whitespace when you hit backspace or delete
;; yeah I'm also gonna stop using this
;; (use-package hungry-delete
;;   :ensure t
;;   :config
;;   (global-hungry-delete-mode))

; expand the marked region in semantic increments (negative prefix to
; reduce region)
(use-package expand-region
:ensure t
:config
(global-set-key (kbd "C-=") 'er/expand-region))

;; end small packages

;; half-scrolling, at last!

;; yeah I'm never using tabs
(set-variable 'indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 200 4))

(setq c-mode-hook
      '(lambda  ( )
         (progn
            (set-variable 'indent-tabs-mode nil)
            ;; other customizations, if any, go here

	    (setq c-default-style "linux"
		  c-basic-offset 4)
            )))

;; (global-whitespace-mode +1)
;; don't need whitespace globally anymore.
(require 'whitespace)
(setq whitespace-line-column 79) ;; limit line length
(setq whitespace-style '(face lines-tail))
; change highlight color for this
; disable for certain modes
;; (setq whitespace-global-modes '(not org-mode not dired-mode))
;; (add-hook 'prog-mode-hook 'whitespace-mode)

(require 'asm-mode)
(add-hook 'asm-mode-hook (lambda ()
                           (setq indent-tabs-mode nil) ; use spaces to indent
			   ; indentation in asm-mode is annoying
                           (electric-indent-mode -1)
                           (setq tab-stop-list (number-sequence 2 60 2))))

(define-key asm-mode-map (kbd "<ret>") 'newline-and-indent)
(define-key asm-mode-map (kbd "M-.") 'helm-etags-select)

;; force popup windows to split horizontally
;; yeah this was a dumb idea
;; (setq split-height-threshold nil)
;; (setq split-width-threshold )

;; ipython support
(use-package ein
  :ensure t
  )
(setq ein:use-auto-complete t)
;; make ein:notebook-login and ein:notebook-open actual commands?
(global-set-key (kbd "C-x C-l") 'ein:notebooklist-login)
(global-set-key (kbd "C-x C-o") 'ein:notebooklist-open)
(add-hook 'ein:notebook-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)))

;; make evil tab character just emulate emacs'
;; same with return
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "TAB") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "SPC") nil))
;; install evil!?!?!?!
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
;; make evil mode beyond the end of a line
(setq evil-move-beyond-eol t)
;; make evil insert state just be emacs normal state (I know, greedy..)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
;; use evil-surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; add dired+-- manually
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'dired+)

;; linum mode
;;(linum-mode)
;; (linum-relative-global-mode)
(setq linum-relative-current-symbol "")

;; add different cursor color support!
(setq evil-insert-state-cursor '((bar . 2) "gray50")
      evil-normal-state-cursor '(box "gray50")
      evil-emacs-state-cursor  '(box "black")
      evil-visual-state-cursor '(box "orange")
      evil-motion-state-cursor '(box "green")
      evil-replace-state-cursor '(box "blue"))

;; function to adjust our global mode for this
;; keep linums on for org mode.. after all that
(define-globalized-minor-mode my-global-linum-mode linum-mode
  (lambda ()
    (unless (or (minibufferp)
                (derived-mode-p 'doc-view-mode 'eshell-mode
                'org-mode 'pdf-view-mode))
      (linum-relative-mode 1))))
;; (my-global-linum-mode)


(define-globalized-minor-mode my-global-display-line-numbers-mode display-line-numbers-mode
  (lambda ()
    (unless (or (minibufferp)
                (derived-mode-p 'doc-view-mode 'eshell-mode
                'pdf-view-mode)) ;; org-mode
      (display-line-numbers-mode 1))))
(my-global-display-line-numbers-mode)

;; ;; Python stuff

;; try to get ipython shell readline error to work
(setq python-shell-completion-native-enable nil)
;; set path in emacs to be the same as terminal!

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;; NOTE conda is needed to set anaconda virtual environment python process.
;;; Elpy can set the anaconda virtual env, but not the process. conda uses
;;; environment.yml (I think to find the process).
(use-package conda
  :ensure t
  :init
  (setq conda-anaconda-home (expand-file-name "~/anaconda"))
  :config
  ;; If you want interactive shell support, include:
  (conda-env-initialize-interactive-shells)
  ;; If you want eshell support, include:
  (conda-env-initialize-eshell)
  ;; If you want auto-activation, include:
  (conda-env-autoactivate-mode t)
  ;; Activate the project/virtual env you want to use.
  ;; Via M-x conda-env-activate RET analyticd-pysystemtrade
  ;; or
  ;; (conda-env-activate "analyticd-pysystemtrade")
  )
;; NOTE elpy provides pyvenv and many other systems for python
;; hacking like jedi, etc. I prefer elpy to anaconda-mode or to just
;; jedi mode.
(use-package elpy
  ;; :disabled t
  :ensure t)
(elpy-enable)
;; use ipython for elpy
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; try out autopep8
(use-package py-autopep8
  :ensure t
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
  )
(add-hook 'python-mode-hook
          'py-autopep8-enable-on-save
	  ;; make flycheck only work over lines
	  ;; (setq flycheck-highlighting-mode 'lines')
          )

(add-hook 'elpy-mode-hook
          '(lambda ()
             (progn
               (setq-local flymake-start-syntax-check-on-newline t)
               (setq-local flymake-no-changes-timeout 0.5))))

;; add c-e and c-a to evil mode-- maybe c-n and c-p too?
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-normal-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-visual-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-visual-state-map (kbd "C-a") 'move-beginning-of-line)

;; redefine c-v to scroll line by line
(define-key evil-normal-state-map (kbd "C-v") 'evil-scroll-line-down)
;; redefine c-; to take the place of tab/c-i in evil normal made
(define-key evil-normal-state-map (kbd "C-;") 'evil-jump-forward)

;; (use-package powerline;;-evil
;;   :ensure t
;;   :config
;;   (powerline-center-evil-theme)
;;   ;;(setq powerline-color1 "#073642") ;; "#073642"
;;   ;;(setq powerline-color2 "#002b36")
;;   ;; (setq powerline-image-apple-rgb t)

;;   ;; (set-face-attribute 'mode-line nil
;;   ;; 		      :inverse-video nil
;;   ;; 		      :foreground "#303030" ;;#fdf6e3
;;   ;; 		      :background "OliveDrab3";;#2aa198
;;   ;; 		      :box nil)
;;   ;; (set-face-attribute 'mode-line-inactive nil
;;   ;; 		      :inverse-video nil
;;   ;; 		      :box nil)
;;   ;; (setq ns-use-srgb-colorspace nil)
;;   )
;; (use-package airline-themes
;;   :ensure t
;;   :config
;;   (airline-themes-set-modeline)
;;   (setq airline-display-directory nil)
;;   )

;; (setq sml/theme 'powerline)
;; (use-package smart-mode-line-powerline-theme
;;   :ensure t
;;   )
;; (use-package smart-mode-line
;;   :ensure t
;;   :config
;;   (sml/setup)
;;   )

;; try making C-x C-b actually move cursor to the buffer list
;; (global-set-key (kbd "C-x C-b") 'my-list-buffers)
(defun my-list-buffers (&optional files-only)
  "Display a list of names of existing buffers.
The list is displayed in a buffer named `*Buffer List*'.
Note that buffers with names starting with spaces are omitted.
Non-null optional arg FILES-ONLY means mention only file buffers.

For more information, see the function `buffer-menu'."
  (interactive "P")
  (switch-to-buffer (list-buffers-noselect files-only)))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-window)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

;; try using magit!!
(use-package magit
  :ensure t
  :config
  (setq magit-commit-show-diff nil
	magit-revert-buffers 1)
 )
;; evil-magit?
(use-package evil-magit
  :ensure t
  )

;; projectile!
;; (use-package projectile
;;   :ensure t
;;   :config
;;   (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;   (projectile-mode +1)
;;   :delight '(:eval (concat " " (projectile-project-name)))
;;   (setq projectile-mode-line "Projectile")
;;   )

; use counsel-projectile as well
;; (use-package counsel-projectile
;;   :ensure t
;;   )

;; treemacs
(use-package treemacs
    :ensure t
    :defer t
    :config
    (progn

      (setq treemacs-follow-after-init          t
            treemacs-width                      35
            treemacs-indentation                2
            treemacs-git-integration            t
            treemacs-collapse-dirs              3
            treemacs-silent-refresh             nil
            treemacs-change-root-without-asking nil
            treemacs-sorting                    'alphabetic-desc
            treemacs-show-hidden-files          t
            treemacs-never-persist              nil
            treemacs-is-never-other-window      nil
            treemacs-goto-tag-strategy          'refetch-index)

      (treemacs-follow-mode t)
      (treemacs-filewatch-mode t))
    :bind
    (:map global-map
          ([f8]        . treemacs-toggle)
          ([f9]        . treemacs-projectile-toggle)
          ("<C-M-tab>" . treemacs-toggle)
          ("M-0"       . treemacs-select-window)
          ("C-c 1"     . treemacs-delete-other-windows)
        ))
  (use-package treemacs-projectile
    :defer t
    :ensure t
    :config
    (setq treemacs-header-function #'treemacs-projectile-create-header))

;; use treemacs-evil
(use-package treemacs-evil
  :ensure t
 )

;; dumb-jump
(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
	 ("M-g j" . dumb-jump-go)
	 ("M-g x" . dumb-jump-go-prefer-external)
	 ("M-g z" . dumb-jump-go-prefer-external-other-window)
	 ("M-g b" . dumb-jump-back))
   :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure

  :config
;; (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
:init
(dumb-jump-mode)
  :ensure
)

;; make fci mode global except for dired and org
(define-globalized-minor-mode global-fci-mode fci-mode
    (lambda ()
      (if (and
           (not (string-match "^\*.*\*$" (buffer-name)))
           (not (eq major-mode 'dired-mode))
	   (not (derived-mode-p 'doc-view-mode 'org-mode 'eshell-mode)))
          ;; gonna try commenting out
          ;; (not (eq major-mode 'org-mode))
          (fci-mode 1))))

;; use fill-column indicator instead of whitespace
(use-package fill-column-indicator
  :ensure t
  :config
  (global-fci-mode 1)
  )
;; set default fill column
(setq default-fill-column 79)

;; add some initial height and width params
(add-to-list 'default-frame-alist '(width . 85))

;; add some ibuffer keybindings to make jk work
(eval-after-load 'ibuffer
  '(progn
     (evil-set-initial-state 'ibuffer-mode 'normal)
     (evil-define-key 'normal ibuffer-mode-map
       (kbd "m") 'ibuffer-mark-forward
       (kbd "t") 'ibuffer-toggle-marks
       (kbd "u") 'ibuffer-unmark-forward
       (kbd "=") 'ibuffer-diff-with-file
       ;;(kbd "j") 'ibuffer-jump-to-buffer
       (kbd "M-g") 'ibuffer-jump-to-buffer
       (kbd "M-s a C-s") 'ibuffer-do-isearch
       (kbd "M-s a M-C-s") 'ibuffer-do-isearch-regexp
       (kbd "j") 'evil-next-line
       (kbd "k") 'evil-previous-line
      (kbd "l") 'ibuffer-visit-buffer
       ;; ...
       )
     )
   )

;; reduce the amount of times the annoying beeper beeps
; Reduce the number of times the bell rings
; Turn off the bell for the listed functions.
(setq ring-bell-function
      (lambda ()
        (unless (memq this-command
                      '(swiper-abort
                        abort-recursive-edit
                        exit-minibuffer
                        keyboard-quit
                        previous-line
                        next-line
                        scroll-down
                        scroll-up
                        cua-scroll-down
                        cua-scroll-up))
          (ding))))
;; okay I'm just gonnna turn this stupid thing off
(setq ring-bell-function 'ignore)

;; yeah I wasn't actually getting this to work properly
;; (require 'smart-dash)

;; add smooth scrolling in here
(use-package smooth-scrolling
  :ensure t
  :config
  ;; (smooth-scrolling-mode 1)
  )

;; yasnippet
(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

;; flycheck!
(use-package flycheck
  :ensure t
  :config
  ;; (global-flycheck-mode t)
  )

;; emacs-jupyter!
(use-package jupyter
  :ensure t
  :config

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(;;(ipython . t) ;; may need to disable for jupyter...
     (latex . t)
     ;; other languages..
     ;; try using jupyter
     (jupyter . t)
     ))
  (setq org-confirm-babel-evaluate nil) 
  ;;; display/update images in the buffer after I evaluate
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

  )

;; ;; add in support for ipython in org mode
;; (use-package ob-ipython
;;   :ensure t
;;   :config
;;   (org-babel-do-load-languages
;;    'org-babel-load-languages
;;    '(;;(ipython . t) ;; may need to disable for jupyter...
;;      (latex . t)
;;      ;; other languages..
;;      ;; try using jupyter
;;      (jupyter . t)
;;      ))
;;   (setq org-confirm-babel-evaluate nil) 
;;   ;;; display/update images in the buffer after I evaluate
;;   (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
;;   )
;; add in export functionality
(require 'jupyter-ipynb)
  
;; fontify code in org blocks
(setq org-src-fontify-natively t)

;; make tab act natively in org source block
(setq org-src-tab-acts-natively t)
;; preserve org source indentation
(setq org-src-preserve-indentation t)

;; gonna try loading here
;; (load-theme 'solarized-light t)

;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; disable emacs lisp flycheck
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; don't let cursor blink
(blink-cursor-mode 0)

;; org-mode stuff for keyworks-- kinda long but whatever
(setq org-todo-keywords
      '(
        (sequence "TODO" "|" "DONE" "WAITING")
        ))

(setq org-todo-keyword-faces
      '(;; ("IDEA" . (:foreground "GoldenRod" :weight bold))
        ;; ("NEXT" . (:foreground "IndianRed1" :weight bold))   
        ;; ("STARTED" . (:foreground "OrangeRed" :weight bold))
        ("WAITING" . (:foreground "coral" :weight bold)) 
        ;; ("CANCELED" . (:foreground "LimeGreen" :weight bold))
        ;; ("DELEGATED" . (:foreground "LimeGreen" :weight bold))
        ;; ("SOMEDAY" . (:foreground "LimeGreen" :weight bold))
        ))

;; use org-evil
(use-package org-evil
  :ensure t
  :config
  )
;; install htmlize for org-babel
(use-package htmlize
  :ensure t
  :config
  )

;; switch command and alt keys for mac
;;; I prefer cmd key for meta
(when (eq system-type 'darwin)
  (setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none
      mac-option-modifier 'super))
;; make alt-h hide emacs
(global-set-key [(super h)] 'ns-do-hide-emacs)

;; make a custom variable to store ipython kernel
(defvar curr-kernel ""
            "The current ipython in use. Defaults to empty string")

;; haskell mode
(use-package haskell-mode
  :ensure t
  :config
  )

;; try disabling fci-mode when using htmlize

;; It is required to disable `fci-mode' when `htmlize-buffer' is called;
;; otherwise the invisible fci characters show up as funky looking
;; visible characters in the source code blocks in the html file.
;; http://lists.gnu.org/archive/html/emacs-orgmode/2014-09/msg00777.html
(with-eval-after-load 'fill-column-indicator
    (defvar modi/htmlize-initial-fci-state nil
    "Variable to store the state of `fci-mode' when `htmlize-buffer' is called.")

    (defun modi/htmlize-before-hook-fci-disable ()
    (setq modi/htmlize-initial-fci-state fci-mode)
    (when fci-mode
	(fci-mode -1)))

    (defun modi/htmlize-after-hook-fci-enable-maybe ()
    (when modi/htmlize-initial-fci-state
	(fci-mode 1)))

    (add-hook 'htmlize-before-hook #'modi/htmlize-before-hook-fci-disable)
    (add-hook 'htmlize-after-hook #'modi/htmlize-after-hook-fci-enable-maybe))

(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-minted-options
           '(("frame" "single")
             ("fontsize" "auto")
             ))

(setq org-latex-verbatim-options
           '(("frame" "single")
             ("fontsize" "auto")
             ))

;; make it so minted uses python style sytnax highlihgting for ipython
(add-to-list 'org-latex-minted-langs '(ipython "python"))

;; make minted work with wolfram language!
(add-to-list 'org-latex-minted-langs '(jupyter-wolfram-language "text"))

;; make it so org blocks don't evaluate on export
(setq org-export-babel-evaluate nil)
;; highlight latex stuff in org
(setq org-highlight-latex-and-related '(latex))

;; make arrow keys work with shell                                                                              

(eval-after-load "shell"
  '(define-key shell-mode-map (kbd "<up>") 'comint-previous-input))

(eval-after-load "shell"
  '(define-key shell-mode-map (kbd "<down>") 'comint-next-input))

;; try enabling electric-pair mode
;; (electric-pair-mode 1)

;; highlight all parenthesis
(show-paren-mode 1)

;;; beamer stuff
(eval-after-load "ox-latex"

  ;; update the list of LaTeX classes and associated header (encoding,
  ;; etc.)  and structure
  '(add-to-list 'org-latex-classes
                `("beamer"
                  ,(concat "\\documentclass[presentation]{beamer}\n"
                           "[DEFAULT-PACKAGES]"
                           "[PACKAGES]"
                           "[EXTRA]\n")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

; haskell mode indentation
(add-hook 'haskell-mode-hook (lambda ()
            (make-local-variable 'tab-stop-list)
            (setq tab-stop-list (number-sequence 2 80 2))
            (setq indent-line-function 'indent-relative)
            (haskell-indentation-mode 0)))

;; good default image width.
(setq org-latex-image-default-width "10cm") 
;; add flyspell to org mode.
(add-hook 'org-mode-hook 'turn-on-flyspell)
;; change ispell location to work.
(setq ispell-program-name "/usr/local/bin/aspell")

;; display relative line numbers
;; (global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; use pdf tools
(use-package pdf-tools
    :ensure t
    :config
    (pdf-tools-install)
    (setq-default pdf-view-display-size 'fit-page)
    (bind-keys :map pdf-view-mode-map
        ("\\" . hydra-pdftools/body)
        ("<s-spc>" .  pdf-view-scroll-down-or-next-page)
        ("g"  . pdf-view-first-page)
        ("G"  . pdf-view-last-page)
        ("l"  . image-forward-hscroll)
        ("h"  . image-backward-hscroll)
        ("j"  . pdf-view-next-page)
        ("k"  . pdf-view-previous-page)
        ("e"  . pdf-view-goto-page)
        ("u"  . pdf-view-revert-buffer)
        ("al" . pdf-annot-list-annotations)
        ("ad" . pdf-annot-delete)
        ("aa" . pdf-annot-attachment-dired)
        ("am" . pdf-annot-add-markup-annotation)
        ("at" . pdf-annot-add-text-annotation)
        ("y"  . pdf-view-kill-ring-save)
        ("i"  . pdf-misc-display-metadata)
        ("s"  . pdf-occur)
        ("b"  . pdf-view-set-slice-from-bounding-box)
        ("r"  . pdf-view-reset-slice))
     (use-package org-pdfview
       :ensure t))

(add-hook 'pdf-view-mode-hook 'auto-revert-mode)

(add-hook 'python-mode-hook
          (lambda () (interactive)
            (setq python-fill-docstring-style 'pep-257-nn)
            (set-fill-column 79)
            ))

;; org default args for python
(setq org-babel-default-header-args:jupyter-python '((:async . "yes")
						     (:session . "py")
						     (:display . "plain")
						     (:results . "scalar")
						     (:exports . "both")))

;; wolfram
(setq org-babel-default-header-args:jupyter-wolfram-language '((:async . "yes")
							       (:exports . "both")
							       (:results . "scalar")
							       (:session . "wo")
							       (:display . "plain")
							       ))

;; try getting wolfram typesetting!
(use-package wolfram-mode
  :ensure t
  :config
  )

;; (set-face-attribute 'mode-line nil  :height 120)
(setq x-underline-at-descent-line t)

;; (use-package telephone-line
;;   :ensure t
;;   :config
;;   (telephone-line-mode 1)
;;   (setq telephone-line-lhs
;; 	'((evil   . (telephone-line-evil-tag-segment))
;; 	  (accent . (telephone-line-vc-segment
;; 		     telephone-line-erc-modified-channels-segment
;; 		     telephone-line-process-segment))
;; 	  (nil    . (telephone-line-minor-mode-segment
;; 		     telephone-line-buffer-segment))))
;;   (setq telephone-line-rhs
;; 	'((nil    . (telephone-line-misc-info-segment))
;; 	  (accent . (telephone-line-major-mode-segment))
;; 	  (evil   . (telephone-line-airline-position-segment))))

;;   (setq telephone-line-height 20)
;;   )

(use-package powerline-evil
  :ensure t
  :config
  (powerline-evil-center-color-theme)
  ;; (set-face-attribute 'mode-line nil
  ;; 		      :foreground "Black"
  ;; 		      :background "Green"
  ;; 		      :box nil)


  ;; (setq powerline-color1 "#073642") ;; "#073642"
  ;; (setq powerline-color2 "#002b36")
  ;; (setq powerline-image-apple-rgb t)


  ;; (set-face-attribute 'mode-line nil
  ;; 		      :inverse-video nil
  ;; 		      :foreground "#303030" ;;#fdf6e3
  ;; 		      :background "OliveDrab3";;#2aa198
  ;; 		      :box nil)
  ;; (set-face-attribute 'mode-line-inactive nil
  ;; 		      :inverse-video nil
  ;; 		      :box nil)

  (setq ns-use-srgb-colorspace nil)

  (set-face-attribute 'powerline-active2 nil :foreground "gray50" :bold t)
  (set-face-attribute 'powerline-active2 nil :background "gray90")

  (set-face-attribute 'powerline-active1 nil :foreground "gray30" :bold t)
  (set-face-attribute 'powerline-active1 nil :background "gray70")

  (set-face-attribute 'powerline-active0 nil :foreground "white")
  (set-face-attribute 'powerline-active0 nil :background "gray30")

  (set-face-attribute 'mode-line nil
		      :foreground "white"
		      :background "gray40"
		      :bold t)
  (setq powerline-height 20)

  )

;; change highlight color!
(set-face-attribute 'region nil :background "orange" :foreground "gray30")


;; use delight to take these stupid minor modes away from powerline
(use-package delight
  :ensure t
  :config
  (delight 'projectile-mode nil t)
  (delight 'undo-tree-mode nil t)
  (delight 'ivy-mode nil t)
  (delight 'linum-relative-mode nil t)
  (delight 'auto-complete-mode nil t)
  (delight 'auto-revert-mode nil t)
  (delight 'magit-mode nil t)
  (delight 'which-key-mode nil t)
  (delight 'beacon-mode nil t)
  (delight 'abbrev-mode nil t)
  (delight 'flycheck-mode nil t)
  (delight 'flyspell-mode nil t)
  (delight 'flymake-mode nil t)
  (delight 'elpy-mode nil t)
  )
(require 'delight-powerline)

;; change org block backgrounds
(set-face-attribute 'org-block-begin-line nil :background "ivory2")
(set-face-attribute 'org-block-end-line nil :background "ivory2")

;; make evil normal state easier on the eyes
(set-face-attribute 'powerline-evil-normal-face nil :background "lime green")

(add-to-list 'org-src-lang-modes '("jupyter-wolfram-language" . "wolfram"))

;; load jupyter keyboard macro convert
(load-file "~/.emacs.d/macros/jupyter_org_babel_convert.macro")
(add-hook 'org-mode-hook (lambda () 
    (local-set-key (kbd "C-c C-g") 'convert-jupyter-babel)
    ))


;; use minimap
(use-package minimap
  :ensure t
  :config
  )

;; (setq flycheck-check-syntax-automatically '(mode-enabled save))

;; better scrolling
(setq scroll-conservatively 101) ;; move minimum when cursor exits view, instead of recentering
(setq mouse-wheel-scroll-amount '(1)) ;; mouse scroll moves 1 line at a time, instead of 5 lines
(setq mouse-wheel-progressive-speed nil) ;; on a long mouse scroll keep scrolling by 1 line

(use-package ag
  :ensure t)
