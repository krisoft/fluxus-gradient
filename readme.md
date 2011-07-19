# gradients for fluxus #

create a list of gradient steps, then use `vgradient` instead of a spagethi of nested vlerps :)

## example code ##

	(require "gradient.ss")
	
	(define grad (list 
					(gradient-step 0   (vector 1 0 0))
					(gradient-step 0.5 (vector 0 1 0))
					(gradient-step 1   (vector 0 0 1))))
	
	(for ((p (in-range 0 1 0.05)))
		(with-state
			(translate (vector (* 20.0 (- p 0.5)) 0 0))
			(colour (vgradient p grad))
			(build-cube)))
