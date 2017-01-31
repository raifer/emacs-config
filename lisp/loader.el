; -*- coding: utf-8 -*-

; Ce fichier permet de :
; - Charger les configurations séparées dans différents fichiers.

; Le fichier de configuration custom.el
; Modifie l'emplacement du custom file pour ne pas écraser emacs.el lors de son édition dans Emacs
(setq custom-file "~/.emacs.d/lisp/custom.el")

; Chargement du custom file en question, si besoin
(load "custom.el")

; Chargement des fichiers de configuration par thème
(load "encoding")
(load "general")
(load "add-packages-archives")
(load "function")
(load "shortcut")
(load "speech")
; Configuration des modes additionels
;(load "markdown-config")
;(load "w3m-config")
;(load "tex-config")

