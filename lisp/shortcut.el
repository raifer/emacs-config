; -*- coding: utf-8 -*-

; Keyboard shortcuts

; go to line
; meta g
(global-set-key [(meta g)] 'goto-line)

; va à la ligne depuis n'importe où et indente automatiquement, fontion perso
; meta j
; newline and indent-end of line
(global-set-key [(meta j)] 'newline-and-indent-end-of-line)

; kill to beginning of line, fonction perso 
; control + shift + k
(global-set-key (kbd "C-S-k") 'kill-to-beginning-of-line)

; kill this buffer
; control x puis k
; permet de ne pas à avoir à confirmer quel buffer fermer
(global-set-key [(control x) (k)] 'kill-this-buffer)

; insert-path-here
; control x puis p
; fonction perso
(global-set-key [(control x) (p)] 'insert-path-here)

; select-next-window and previous-window 
; control supérieur et inférieur
; fonction perso
(global-set-key [(control >)] 'select-next-window)
(global-set-key [(control <)] 'select-previous-window)

; replace-string
; ctrl ù
(global-set-key [(meta %)] 'replace-string)

; w3m
; va au lien sous le point
(global-set-key "\C-xm" 'browse-url-at-point)

; undo only, l'action d'annulation n'est pas ajoutée dans la liste des actions.
; Permet de prendre son temps 
(global-set-key [(control _)] 'undo-only)

; indente la ligne en cours ou la region, fontion perso
; sinon, fonctionnement par défaut : place un commentaire en fin de ligne
; Control point virgule
(global-set-key [(control \;)] 'comment-or-uncomment-region-or-line)  
