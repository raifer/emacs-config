; -*- coding: utf-8 -*-

; Charge le mode Markdown pour les fichiers portant l'extension .md
(setq auto-mode-alist
             (cons '("\\.md" . markdown-mode) auto-mode-alist)
)

(custom-set-variables
; Ajout de la ligne de meta dans le header pour le code HTML afin que le navigateur web travail en UTF8
'(markdown-xhtml-header-content "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /> ")
      )

; retour à la ligne automatiquement
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)

					; Si la ligne est trop longue :
					; ne tronque plus le déplacement
					; Par défaut, le point se retrouve au mil lieu de la ligne
(add-hook 'markdown-mode-hook (lambda () (setq truncate-lines t)))

; Charger le mode markdown à partir d'un fichier
; pas nécessaire si markdown-mode à été installé avec les paquets.
;(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)

