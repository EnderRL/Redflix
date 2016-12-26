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
        d4 - Day  
    )
    (:init
       (predecessor c1 c3)
       (predecessor c2 c3)
       (predecessor c3 c4)
       (desiredContent c4)
       (= (predecessorsToAsign c1) 0)
       (= (predecessorsToAsign c2) 0)
       (= (predecessorsToAsign c3) 2)
       (= (predecessorsToAsign c4) 1)
       (= (numDay d1) 1)
       (= (numDay d2) 2)
       (= (numDay d3) 3)
       (= (numDay d4) 4)
       (= (maxDay c1) 0)
       (= (maxDay c2) 0)
       (= (maxDay c3) 0)
       (= (maxDay c4) 0)
    )
    (:goal (forall (?content - Content) (imply (desiredContent ?content) (asignedContent ?content))))
)