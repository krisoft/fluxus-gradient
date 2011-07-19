#lang racket/base

(require fluxus-018/fluxus)
(provide
	gradient-step
	vgradient
	hexColour)

(define (vgradientLast pos list last)
    (if (null? list)
        (vy last)
        (if (<= pos (vx (car list)))
            (vlerp (vy last) (vy (car list))
                (/ (- pos (vx last)) (- (vx (car list)) (vx last))))
            (vgradientLast pos (cdr list) (car list)))))

(define (vgradient pos list)
    (if (<= pos (vx (car list)))
        (vy (car list))
        (vgradientLast pos (cdr list) (car list))))

(define-syntax gradient-step
    (syntax-rules ()
        ((gradient-step pos color) (vector pos color))
        ((gradient-step pos r g b) (vector pos (vector r g b)))
        ((gradient-step pos r g b a) (vector pos (vector r g b a)))))
        
(define (hexColour color)
    (if (> (string-length color) 0)
        (let* ((cs (if (equal? #\# (string-ref color 0))
                      (substring color 1)
                      color))
                (length (string-length cs)))
            (vdiv (cond ((= length 3)
                    (vector (string->number (make-string 2 (string-ref cs 0)) 16)
                            (string->number (make-string 2 (string-ref cs 1)) 16)
                            (string->number (make-string 2 (string-ref cs 2)) 16)))
                  ((= length 6)
                    (vector (string->number (substring cs 0 2) 16)
                            (string->number (substring cs 2 4) 16)
                            (string->number (substring cs 4 6) 16)))
                  (else (vector 0 0 0))) 255))
        (vector 0 0 0)))