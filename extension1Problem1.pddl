(define (problem basicProblem1)
    (:domain redflix)
    (:objects c1 - Content c2 - Content c3 - Content)
    (:init
        (predecessor c2 c1)
        (predecessor c3 c1)
        (= (predecessorsToAsign c1) 2)
        (= (predecessorsToAsign c2) 1)
        (= (predecessorsToAsign c3) 1)

    )
    (:goal (forall (?content - Content) (asignedContent ?content)))
)