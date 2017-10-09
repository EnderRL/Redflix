(define (problem basicProblem1)
    (:domain redflix)
    (:objects 
        c1 - Content 
        c2 - Content 
        c3 - Content 
        c4 - Content
    )
    (:init
       (asignedContent c1)      ;c1 es un contenido ya visualizado
       (asignedPredecessor c2)  
       (asignedPredecessor c3)
       (asignedPredecessor c4)
       (desiredContent c1)
       (desiredContent c2)
       (desiredContent c3)
       (desiredContent c4) 
 
    )
    (:goal (forall (?content - Content) (imply (desiredContent ?content) (asignedContent ?content))))
)