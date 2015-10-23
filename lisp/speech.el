; -*- coding: utf-8 -*-

; speech dispacher 
; ajout du du dossier /usr/share/emacs/site-lisp/speechd-el au path
(add-to-list 'load-path "/usr/share/emacs/site-lisp/speechd-el")

; Charge speechd-speak
;(load-library "speechd-speak")
(autoload 'speechd-speak "speechd-speak" nil t) 
; Lance speechd-el
(speechd-speak)

; configuration de speechd-el
(custom-set-variables
;(load-library "speechd-ssip")
 '(speechd-out-active-drivers (quote (ssip)))

; echo touche off
'(speechd-speak-echo nil)

; Ne lit pas les commande tapées
'(speechd-speak-read-command-keys nil)

; langue
'(speechd-speak-input-method-languages (quote (("fr" . "") ("" . "") ("" . "fr"))))

					; Règle la vitesse
'(speechd-voices (quote ((nil (rate . 40) (capital-character-mode . spell)))))
)

					; shortkey
; lire la ligne en cours avec control l
(global-set-key [(C l)] 'speechd-speak-read-line)
