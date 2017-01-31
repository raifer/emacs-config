; -*- coding: utf-8 -*-

; Gestion du sytème de package avec Emacs
(require 'package)

;ajout du server melpa pour elpa
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/"))

					; Mise à jour auto de la liste des paquets
; La suite est commenté pour que Emacs démarre plus rapidement
; Refresh the packages descriptions
(unless package-archive-contents    
(package-refresh-contents))

; initialise le système de paquet
(package-initialize)
; List all of packages to load
;(setq package-load-list '(all))     

