; -*- coding: utf-8 -*-

; lance auctex, normalement automatique
(load "auctex.el" nil t t)

(setq TeX-auto-save t)

; prend en compte certain éléments du fichier en cours
(setq TeX-parse-self t)

; aware of of multi-file
(setq-default TeX-master nil)

(global-set-key [(control c) (f)] 'TeX-next-error)

; retour à la ligne automatiquement
(add-hook 'TeX-mode-hook 'turn-on-auto-fill)

; utilise pdf latex
; a vérifier
(setq TeX-PDF-mode t)

; référence mode
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)


