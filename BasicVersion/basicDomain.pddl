(define (domain redflix)

    (:requirements
      :typing
    )

    (:types
        Content
    )

    (:constants
    )

    (:predicates
        (predecessor ?C1 - Content ?C2 - Content) ;Contenido C1 se tiene que ver antes que C2
        (asignedContent ?C - Content)
        (asignedPredecessor ?C - Content)
    )

    (:functions
    )

    (:action asignContentToDay
        :parameters (?content - Content)
        :precondition (and (not (asignedContent ?content)) (asignedPredecessor ?content))
        :effect 
            (and 
                (asignedContent ?content) 
                (forall (?content2 - Content)
                    (when (predecessor ?content ?content2)
                        (asignedPredecessor ?content2)
                    )
                )
            )
    )
)