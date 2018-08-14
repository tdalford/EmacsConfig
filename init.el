;;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "fd2cf9ad9895d93138dd67215702280e0db56e796ee62dea92043eed4b23177c" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "b4c13d25b1f9f66eb769e05889ee000f89d64b089f96851b6da643cee4fdab08" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (evil-surround flycheck doom-themes yasnippet-snippets delight-powerline delight diminish smooth-scrolling monokai-light-theme spacemacs-theme fill-column-indicator counsel-projectile treemacs-evil treemacs-projectile evil-magit projectile magit Magit powerline-evil monokai-theme column-marker py-autopep8 exec-path-from-shell conda yasnippet elpy better-defaults minimap linum-relative evil ein neotree expand-region hungry-delete beacon golden-ratio-scroll-screen color-theme solarized-dark-theme solarized-theme planet-theme zenburn-theme auto-complete counsel tabbar ace-window org-bullets which-key try use-package)))
 '(whitespace-global-modes (quote (not dired-mode org-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

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
                                (mode . c++-mode)))
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
    (setq ivy-wrap t)
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

(load-theme 'solarized-dark t)
;; gonna try out default theme again..

;; get some doom themes
(use-package doom-themes
  :ensure t
  :config
  )
;; (load-theme 'doom-nord-light)

; (use-package monokai-light-theme
;;  :ensure t
;;  :config (load-theme 'monokai-light t))

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
; (setq beacon-color "#666600")
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
(setq evil-insert-state-cursor '((bar . 2) "white")
      evil-normal-state-cursor '(box "white")
      evil-emacs-state-cursor  '(box "black")
      evil-visual-state-cursor '(box "orange")
      evil-motion-state-cursor '(box "green")
      evil-replace-state-cursor '(box "blue"))


;; function to adjust our global mode for this
(define-globalized-minor-mode my-global-linum-mode linum-mode
  (lambda ()
    (unless (or (minibufferp)
                (derived-mode-p 'doc-view-mode 'org-mode 'eshell-mode))
      (linum-relative-mode 1))))
(my-global-linum-mode)

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
          )

;; add c-e and c-a to evil mode-- maybe c-n and c-p too?
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-normal-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-visual-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-visual-state-map (kbd "C-a") 'move-beginning-of-line)

;; redefine c-v to scroll line by line
(define-key evil-normal-state-map (kbd "C-v") 'evil-scroll-line-down)

;; (use-package powerline
;;   :ensure t
;;   :config
;;  (powerline-center-evil-theme)
;;   )

(use-package powerline-evil
  :ensure t
  :config
  (powerline-evil-center-color-theme)
  (set-face-attribute 'mode-line nil
  		      :foreground "Black"
  		      :background "Green"
  		      :box nil)
  )
;; use diminish to take these stupid minor modes away from powerline
(use-package delight
  :ensure t
  :config
  )
(require 'delight-powerline)
(delight 'projectile-mode nil t)
(delight 'undo-tree-mode nil t)
(delight 'ivy-mode nil t)
(delight 'linum-relative-mode nil t)
(delight 'auto-complete-mode nil t)
(delight 'which-key-mode nil t)
(delight 'auto-revert-mode nil t)
(delight 'beacon-mode nil t)
(delight 'abbrev-mode nil t)
(delight 'flycheck-mode nil t)

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
 )
;; evil-magit?
(use-package evil-magit
  :ensure t
  )

;; projectile!
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1)
  :delight '(:eval (concat " " (projectile-project-name)))
  )

; use counsel-projectile as well
(use-package counsel-projectile
  :ensure t
  )

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
	 ("M-g z" . dumb-jump-go-prefer-external-other-window))
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

;; yeah I wasn't actually getting this to work properly
(require 'smart-dash)

;; add smooth scrolling in here
(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1)
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
  (global-flycheck-mode t)
  )


(provide 'init)

;;; init.el ends here
