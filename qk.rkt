#lang racket
(require 2htdp/image)

(define p1 (text "Q" 10 "black"))
(define p2 (text "K" 10 "black"))

(define QK
  (let ([qk (beside p1 p2)])
    (overlay
     qk
     (circle (/ (image-width qk) 1.8)
             "solid" "white"))))
(provide QK)

(define QK-512x512
  (scale (/ 512.0 (image-width QK))
         QK))

(define QK-256x256
  (scale (/ 256.0 (image-width QK))
         QK))

<(module+ main
  (save-image QK-256x256 "QK-256x256.png"))
