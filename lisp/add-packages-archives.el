; -*- coding: utf-8 -*-

; Gestion du sytème de package avec Emacs
(require 'package)

 ;ajout du server org pour elpa
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)

 ;ajout du server melpa pour elpa
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)

					; Mise à jour auto de la liste des paquets
; La suite est commenté pour que Emacs démarre plus rapidement
; Refresh the packages descriptions
;(unless package-archive-contents    
;  (package-refresh-contents))

; initialise le système de paquet
;(package-initialize)                
; List all of packages to load
;(setq package-load-list '(all))     

