;; Carga el fichero config.org que contiene la configuration
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; Carga el fichero de autoconfiguracion de Emacs
(setq custom-file "~/.emacs.d/autocomf.el")
(when (file-exists-p custom-file)
    (load-file custom-file))
