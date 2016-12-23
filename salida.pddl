(define (problem basicProblem1)
(:domain redflix)
(:objects
	c0 - Content
	c1 - Content
	c2 - Content
	c3 - Content
	c4 - Content
	c5 - Content
	c6 - Content
	c7 - Content
	c8 - Content
	c9 - Content
	c10 - Content
	c11 - Content
	c12 - Content
	c13 - Content
	c14 - Content
	d0 - Day
	d1 - Day
	d2 - Day
	d3 - Day
	d4 - Day
	d5 - Day
	d6 - Day
	d7 - Day
	d8 - Day
	d9 - Day
	d10 - Day
	d11 - Day
	d12 - Day
	d13 - Day
	d14 - Day
)
(:init
	(predecessor c3 c5)
	(predecessor c4 c9)
	(predecessor c10 c5)
	(predecessor c3 c12)
	(predecessor c10 c11)
	(predecessor c4 c14)
	(predecessor c3 c14)
	(predecessor c7 c8)
	(predecessor c14 c12)
	(predecessor c7 c1)
	(= (numDay d0) 0)
	(= (numDay d1) 1)
	(= (numDay d2) 2)
	(= (numDay d3) 3)
	(= (numDay d4) 4)
	(= (numDay d5) 5)
	(= (numDay d6) 6)
	(= (numDay d7) 7)
	(= (numDay d8) 8)
	(= (numDay d9) 9)
	(= (numDay d10) 10)
	(= (numDay d11) 11)
	(= (numDay d12) 12)
	(= (numDay d13) 13)
	(= (numDay d14) 14)
	(= (predecessorsToAsign c0) 0)
	(= (predecessorsToAsign c1) 1)
	(= (predecessorsToAsign c2) 0)
	(= (predecessorsToAsign c3) 0)
	(= (predecessorsToAsign c4) 0)
	(= (predecessorsToAsign c5) 2)
	(= (predecessorsToAsign c6) 0)
	(= (predecessorsToAsign c7) 0)
	(= (predecessorsToAsign c8) 1)
	(= (predecessorsToAsign c9) 1)
	(= (predecessorsToAsign c10) 0)
	(= (predecessorsToAsign c11) 1)
	(= (predecessorsToAsign c12) 2)
	(= (predecessorsToAsign c13) 0)
	(= (predecessorsToAsign c14) 2)
)
 (:goal (forall (?content - Content) (asignedContent ?content)))
)
