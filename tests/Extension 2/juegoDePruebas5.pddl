(define (problem basicProblem1)
(:domain redflix)
(:objects
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
)
(:init
	(asignedContent c1)

	(desiredContent c9)
	(desiredContent c3)
	(desiredContent c10)
	(desiredContent c7)
	(desiredContent c8)
	(desiredContent c6)

	(predecessor c4 c5)
	(predecessor c3 c4)
	(predecessor c1 c4)
	(predecessor c1 c6)
	(predecessor c4 c9)

	(parallel c3 c6)
	(parallel c6 c3)
	(parallel c8 c2)
	(parallel c2 c8)
	(parallel c6 c5)
	(parallel c5 c6)
	(parallel c8 c6)
	(parallel c6 c8)
	(parallel c4 c6)
	(parallel c6 c4)

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

	(= (maxDay c1) 0)
	(= (maxDay c2) 0)
	(= (maxDay c3) 0)
	(= (maxDay c4) 0)
	(= (maxDay c5) 0)
	(= (maxDay c6) 0)
	(= (maxDay c7) 0)
	(= (maxDay c8) 0)
	(= (maxDay c9) 0)
	(= (maxDay c10) 0)

	(= (predecessorsToAsign c1) 0)
	(= (predecessorsToAsign c2) 0)
	(= (predecessorsToAsign c3) 0)
	(= (predecessorsToAsign c4) 1)
	(= (predecessorsToAsign c5) 1)
	(= (predecessorsToAsign c6) 0)
	(= (predecessorsToAsign c7) 0)
	(= (predecessorsToAsign c8) 0)
	(= (predecessorsToAsign c9) 1)
	(= (predecessorsToAsign c10) 0)
)
(:goal (forall (?content - Content) (imply (desiredContent ?content) (asignedContent ?content))))
)
