(require 'package)

;; Adding the package repos.
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

;; Custom functions
(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs"))

(defun edit-init-file ()
  (interactive)
  (find-file "~/.emacs"))

(defun d-drive-dired ()
  (interactive)
  (dired "D:/SVN/"))

;; Adding requirements
(require 'evil)
(require 'doom-themes)
(require 'sublime-themes)
(require 'general)
(require 'linum-relative)

;; Evil
(global-evil-leader-mode)
(evil-mode t)

;; Leaders setup
(setq general-default-keymaps 'evil-normal-state-map)
(setq my-leader1 "SPC")
(setq general-default-prefix "SPC")

;; Leader bindings
(general-define-key "ff" 'find-file)
(general-define-key "bb" 'buffer-menu)
(general-define-key "dd" 'd-drive-dired)
(general-define-key "rc" 'reload-init-file)
(general-define-key "ec" 'edit-init-file)
(general-define-key "o" 'maximize-window)
(general-define-key "kb" 'kill-buffer)
(general-define-key "v" 'split-window-horizontally)
(general-define-key "s" 'split-window-vertically)
(general-define-key "wl" 'windmove-right)
(general-define-key "wh" 'windmove-left)
(general-define-key "wj" 'windmove-down)
(general-define-key "wk" 'windmove-up)

;; General Settings
(global-auto-revert-mode t)
(set-default 'truncate-lines t) ; wrapping
(linum-mode)
(linum-relative-global-mode) ; line numbers
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(eval-after-load
 'company
 '(add-to-list 'company-backends 'company-omnisharp))

;; Styling / UI Setup
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1) 
(setq doom-themes-enable-bold nil
      doom-themes-enable-italic nil)
(load-theme 'doom-molokai t)

;; Use scratch instead of splash screen
(setq inhibit-splash-screen t)
(switch-to-buffer "**")
(setq omnisharp-server-executable-path "C:\\Users\\alex.warren\\omnisharp\\OmniSharp.exe")

;; Example evil-mode config

(evil-define-key 'insert omnisharp-mode-map (kbd "M-.") 'omnisharp-auto-complete)
(evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition)
(evil-define-key 'normal omnisharp-mode-map (kbd "g u") 'omnisharp-find-usages)
(evil-define-key 'normal omnisharp-mode-map (kbd "g I") 'omnisharp-find-implementations) ; g i is taken
(evil-define-key 'normal omnisharp-mode-map (kbd "g o") 'omnisharp-go-to-definition)
(evil-define-key 'normal omnisharp-mode-map (kbd "g r") 'omnisharp-run-code-action-refactoring)
(evil-define-key 'normal omnisharp-mode-map (kbd "g f") 'omnisharp-fix-code-issue-at-point)
(evil-define-key 'normal omnisharp-mode-map (kbd "g F") 'omnisharp-fix-usings)
(evil-define-key 'normal omnisharp-mode-map (kbd "g R") 'omnisharp-rename)
(evil-define-key 'normal omnisharp-mode-map (kbd ", i") 'omnisharp-current-type-information)
(evil-define-key 'normal omnisharp-mode-map (kbd ", I") 'omnisharp-current-type-documentation)
(evil-define-key 'insert omnisharp-mode-map (kbd ".") 'omnisharp-add-dot-and-auto-complete)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n t") 'omnisharp-navigate-to-current-file-member)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n s") 'omnisharp-navigate-to-solution-member)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n f") 'omnisharp-navigate-to-solution-file-then-file-member)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n F") 'omnisharp-navigate-to-solution-file)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n r") 'omnisharp-navigate-to-region)
(evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
(evil-define-key 'insert omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
(evil-define-key 'normal omnisharp-mode-map (kbd ",.") 'omnisharp-show-overloads-at-point)
(evil-define-key 'normal omnisharp-mode-map (kbd ",rl") 'recompile)

(evil-define-key 'normal omnisharp-mode-map (kbd ",rt")
  (lambda() (interactive) (omnisharp-unit-test "single")))

(evil-define-key 'normal omnisharp-mode-map
  (kbd ",rf")
  (lambda() (interactive) (omnisharp-unit-test "fixture")))

(evil-define-key 'normal omnisharp-mode-map
  (kbd ",ra")
  (lambda() (interactive) (omnisharp-unit-test "all")))

;; Speed up auto-complete on mono drastically. This comes with the
;; downside that documentation is impossible to fetch.
(setq omnisharp-auto-complete-want-documentation nil)

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" "6f11ad991da959fa8de046f7f8271b22d3a97ee7b6eca62c81d5a917790a45d9" default)))
 '(line-number-mode nil)
 '(package-selected-packages
   (quote
    (xkcd racket-mode slime-company omnisharp linum-relative sublime-themes general evil-leader doom-themes color-theme evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
