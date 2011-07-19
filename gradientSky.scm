(clear)

(require "gradient.ss")

(define grad (list
                (gradient-step 0   (vector 0 0 0))
                (gradient-step 2.5 (vector 1 0.6 0))
                (gradient-step 10.0 (vector 0 0.4 1))))
(define timeStamp (time))
(every-frame
            (clear-colour (vgradient (- (time) timeStamp) grad)))