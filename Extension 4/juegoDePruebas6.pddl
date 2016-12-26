(define (problem basicProblem1)
    (:domain redflix)
    (:objects 
        c1 - Content 
        c2 - Content 
        c3 - Content 
        d1 - Day 
        d2 - Day 
    )
    (:init
       (desiredContent c1)
       (desiredContent c2)
       (desiredContent c3)
       (= (predecessorsToAsign c1) 0)
       (= (predecessorsToAsign c2) 0)
       (= (predecessorsToAsign c3) 0)
       (= (maxDay c1) 0)
       (= (maxDay c2) 0)
       (= (maxDay c3) 0)
       (= (minContent c1) 200)
       (= (minContent c2) 100)
       (= (minContent c3) 100)
       (= (minDay d1) 0)
       (= (minDay d2) 0)
       (= (numDay d1) 1)
       (= (numDay d2) 2)

    )
    (:goal (forall (?content - Content) (imply (desiredContent ?content) (asignedContent ?content))))
)