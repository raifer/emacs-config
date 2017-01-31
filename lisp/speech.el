; -*- coding: utf-8 -*-

; speech dispacher 
; ajout du du dossier /usr/share/emacs/site-lisp/speechd-el au path
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/speechd-el")

; Charge speechd-el
(autoload 'speechd-speak "speechd-speak" nil t) 
; Lance speechd-el
(speechd-speak)

; configuration de speechd-el
;echo character word or nil
(setq speechd-speak-echo 'word)

; Ne lit pas les commande tapées
(setq speechd-speak-read-command-keys nil)



(custom-set-variables
;(load-library "speechd-ssip")
;'(speechd-out-active-drivers (quote (ssip)))

; langue
;'(speechd-speak-input-method-languages (quote (("fr" . "") ("" . "") ("" . "fr"))))

					; Règle le débit
'(speechd-voices (quote ((nil (rate . 15) (capital-character-mode . none)))))
)

					; shortkey
; lire la ligne en cours avec control l
(global-set-key [(C l)] 'speechd-speak-read-line)

