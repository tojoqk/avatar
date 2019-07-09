#lang racket
(require 2htdp/image)

(define c0 50)
(define c1 80)
(define c3 20)
(define bk 255)

(define base (text "Tojo" 10 (make-color c0 c0 c0)))
(define (p1 k) (text "Q" 10
                     (if (even? k)
                         (make-color c3 c3 c3)
                         (make-color c1 c1 c1))))
(define (p2 k) (text "K" 10
                     (if (even? k)
                         (make-color c1 c1 c1)
                         (make-color c3 c3 c3))))

(define TojoQK
  (let* ([tojoqk
          (let loop ([n 36])
            (cond
              [(zero? n) base]
              [else
               (beside (p1 n)
                       (scale 1.06 (rotate 110 (loop (- n 1))))
                       (p2 n))]))]
         [background
          (circle (/ (image-width tojoqk) 2)
                  "solid" (make-color bk bk bk))])
    (overlay tojoqk background)))
(provide TojoQK)

(define TojoQK-256x256
  (scale (/ 256.0 (image-width TojoQK))
         TojoQK))

(module+ main
  (save-image TojoQK-256x256 "TojoQK-256x256.png")
  #;
  (save-image TojoQK "TojoQK.png"))
