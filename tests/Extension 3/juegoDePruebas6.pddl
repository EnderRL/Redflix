(define (problem basicProblem1)
    (:domain redflix)
    (:objects 
        c1 - Content 
        c2 - Content 
        c3 - Content 
        c4 - Content 
        c5 - Content 
        c6 - Content 
        d1 - Day 
        d2 - Day 
        d3 - Day 
    )
    (:init
       (desiredContent c1)
       (desiredContent c2)
       (desiredContent c3)
       (desiredContent c4)
       (desiredContent c5)
       (desiredContent c6)
       (= (predecessorsToAsign c1) 0)
       (= (predecessorsToAsign c2) 0)
       (= (predecessorsToAsign c3) 0)
       (= (predecessorsToAsign c4) 0)
       (= (predecessorsToAsign c5) 0)
       (= (predecessorsToAsign c6) 0)
       (= (numDay d1) 1)
       (= (numDay d2) 2)
       (= (numDay d3) 3)
       (= (maxDay c1) 0)
       (= (maxDay c2) 0)
       (= (maxDay c3) 0)
       (= (maxDay c4) 0)
       (= (maxDay c5) 0)
       (= (maxDay c6) 0)
       (= (numContentDay d1) 0)
       (= (numContentDay d2) 0)
       (= (numContentDay d3) 0)

    )
    (:goal (forall (?content - Content) (imply (desiredContent ?content) (asignedContent ?content))))
)