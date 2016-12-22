(define (domain redflix)

    (:requirements
      :typing
      :fluents
    )

    (:types
        Content
    )

    (:constants
    )

    (:predicates
        (predecessor ?C1 - Content ?C2 - Content) ;Contenido C1 se tiene que ver antes que C2
        (asignedContent ?C - Content)
    )

    (:functions
        (predecessorsToAsign ?content - Content)
    )

    (:action asignContentToDay
        :parameters (?content - Content)
        :precondition (and (not (asignedContent ?content)) (= (predecessorsToAsign ?content) 0))
        :effect 
            (and 
                (asignedContent ?content) 
                (forall (?content2 - Content)
                    (when (predecessor ?content ?content2)
                        (decrease (predecessorsToAsign ?content2) 1)
                    )
                )
            )
    )
)