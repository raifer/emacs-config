; -*- coding: utf-8 -*-

; choisir w3m par défaut
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-bronse-url "w3m" "Ask a WWW browser to show a url." t)

; Donne le nom du lien et pas l'adresse
(defadvice w3m-print-this-url (around my-w3m-print-this-url activate)
  (when (eq this-command 'w3m-print-this-url)
    ad-do-it))

; passe en mode buffer w3m, ce qui redonne aussi les flèches 
(custom-set-variables
'(w3m-key-binding (quote info))
)
