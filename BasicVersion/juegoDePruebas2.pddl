(define (problem basicProblem1)
    (:domain redflix)
    (:objects 
        c1 - Content 
        c2 - Content 
    )
    (:init
       (predecessor c1 c2)
       (asignedPredecessor c1)  
       (desiredContent c2)
    )
    (:goal (forall (?content - Content) (imply (desiredContent ?content) (asignedContent ?content))))
)