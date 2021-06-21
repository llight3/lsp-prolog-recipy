;;; lang/prolog/config.el -*- lexical-binding: t; -*-
(after! prolog-mode
  (if (featurep! +lsp)
      (add-hook 'prolog-mode-local-vars-hook #'lsp!)))

(setq-default prolog-system 'swi)

(use-package! ediprolog
  :defer t
  :config
  (global-set-key [f10] 'ediprolog-dwim))

(use-package! ob-prolog
  :defer t
  :after org)

(use-package! etrace)

(if (featurep! +lsp)
   (use-package lsp-mode
   :commands (lsp lsp-defered)
   :hook (prolog-mode-hook . lsp-defered)
   :config
   (lsp-register-client
   (make-lsp-client
   :new-connection
   (lsp-stdio-connection (list "swipl"
                                   "-g" "use_module(library(lsp_server))."
                                   "-g" "lsp_server:main"
                                   "-t" "halt"
                                   "--" "stdio"))
   :major-modes '(prolog-mode)
   :priority 1
   :multi-root t
   :server-id 'prolog-ls))
   (add-to-list 'lsp-language-id-configuration '(prolog-mode . "prolog"))))
