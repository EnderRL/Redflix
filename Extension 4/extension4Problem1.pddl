(define (problem basicProblem1)
    (:domain redflix)
    (:objects 
      c1 - Content
      c2 - Content 
      c3 - Content
      c4 - Content
      d1 - Day 
      d2 - Day 
      d3 - Day
      
    )
    (:init
        (desiredContent c1)
		(desiredContent c2)
		(desiredContent c3)
		(desiredContent c4)
        (= (predecessorsToAsign c1) 0)
        (= (predecessorsToAsign c2) 0)
        (= (predecessorsToAsign c3) 0)
        (= (predecessorsToAsign c4) 0)
        (= (numDay d1) 1)
        (= (numDay d2) 2)
        (= (numDay d3) 3)
        (= (minDay d1) 0)
        (= (minDay d2) 0)
        (= (minDay d3) 0)
        (= (minContent c1) 100)
        (= (minContent c2) 120)
        (= (minContent c3) 60)
        (= (minContent c4) 200)
 
    )
    (:goal (forall (?content - Content) (imply (desiredContent ?content) (asignedContent ?content)))
)