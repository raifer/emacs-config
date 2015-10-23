; -*- coding: utf-8 -*-

; Démarre Emacs en pleine écran
(setq initial-frame-alist '((fullscreen . maximized)))

;remplace les bips par un flash
(setq visible-bell t)

; Pas de message d'accueil
(setq inhibit-startup-message t)

; mode text par défaut
(setq default-major-mode 'text-mode)

					; démarre le serveur emacs automatiquement
; A faire : pb si un second emacs est lancé
(server-start)

; Retient la position du curseur lors de la dernière utilisation  du fichier
; enregistré dans .emacs.d/saved_places
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved_places")

; remplacer le 'yes' par 'y' et 'no' par 'n' 
(fset 'yes-or-no-p 'y-or-n-p)

; iswitchb
; pour naviguer facilement entre les buffers avec C-x B
; affiche la liste des buffers et l'autocomplétion fait le reste
(iswitchb-mode t)
(require 'iswitchb nil t)
(when (fboundp 'iswitchb-default-keybindings)
(iswitchb-default-keybindings))

; suprimme toute la phrase si control-k est utilisé tout au début de la ligne
(setq-default kill-whole-line t)

; regrouppement des backup dans emacs.d
(setq backup-directory-alist
  '((".*" . "~/.emacs.d/backup")))

; regrouppement des auto save  dans emacs.d
; ne marche pas encore
;(setq auto-save-file-name-transforms
;  '((".*" . "~/.emacs.d/auto_saved" . t)))

					; retour à la ligne automatique
; désactivé
; activé pour TeX-mode dans tex-config.el
; mode text
					;(add-hook 'text-mode-hook 'turn-on-auto-fill)
; mode c
;(add-hook 'c-mode-hook 'turn-on-auto-fill)
; mode python
					;(add-hook 'python-mode-hook 'turn-on-auto-fill)

; truncate-lines T
; Laisse la ligne trop longue sur une seul ligne
; pour python seulement
(add-hook 'python-mode-hook (lambda () (setq truncate-lines t)))
; En générale
					;(set-default 'truncate-lines t)

					; ortographe
; utilisation du logiciel aspell
(setq-default ispell-program-name "aspell")

