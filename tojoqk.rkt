#lang racket
(require 2htdp/image)

(define size 10)
(define base (text "Tojo" size "black"))
(define p1 (text "Q" size "black"))
(define p2 (text "K" size "black"))

(define TojoQK
  (let* ([tojoqk
          (let loop ([n (* 36 1)])
            (cond
              [(zero? n) base]
              [else
               (beside p1
                       (scale 1.08 (rotate 110 (loop (- n 1))))
                       p2)]))]
         [background
          (rectangle (image-width tojoqk)
                     (image-height tojoqk)
                     "solid" "white")])
    (overlay tojoqk background)))
(provide TojoQK)

(module+ main
  (save-image TojoQK "TojoQK.png"))
