;; Hace a Emacs mas rapido
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;; Initialize melpa repo solo si se conecta
(require 'package)
(setq package-enable-at-startup nil)
;(add-to-list 'package-archives
;        '("melpa" . "https://melpa.org/packages/"))
(let ((melpa-url "https://melpa.org/packages/"))
  (when (condition-case nil
            (with-current-buffer (url-retrieve-synchronously melpa-url t t 5)
              (goto-char (point-min))
              (search-forward "HTTP/1.1 200" nil t))
          (error nil))
    (add-to-list 'package-archives (cons "melpa" melpa-url) t)))
(package-initialize)

;; Initialize use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Carga el fichero config.org que contiene la configuration
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; Carga el fichero de autoconfiguracion de Emacs
(setq custom-file "~/.emacs.d/autocomf.el")
(when (file-exists-p custom-file)
    (load-file custom-file))
