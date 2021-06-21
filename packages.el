;; -*- no-byte-compile: t; -*-
;;; lang/prolog/packages.el

(package! ediprolog :pin "514c8ad360671f9d6cc4aeaaaa95b5aa5bbc0103")
(package! ob-prolog :pin "331899cfe345c934026c70b78352d320f7d8e239")
(package! etrace :recipe
  (:host github
   :repo "llight3/etrace.el"
   :branch "main")
   :pin "13a2fa94d6426cbb058e3b6ae0db8e0264a71f2b")
