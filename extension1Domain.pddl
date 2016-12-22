(define (domain redflix)

    (:requirements
      :typing
      :fluents
    )

    (:types
        Content
        Day
    )

    (:constants
    )

    (:predicates
        (predecessor ?C1 - Content ?C2 - Content) ;Contenido C1 se tiene que ver antes que C2
        (asignedContent ?C - Content)
    )

    (:functions
        (predecessorsToAsign ?content - Content)
        (numDay ?day - Day)
        (minDay ?content - Content)
    )

    (:action asignContentToDay
        :parameters (?content - Content ?day - Day)
        :precondition 
            (and
                (not (asignedContent ?content))
                (= (predecessorsToAsign ?content) 0)
                (> (numDay ?day) (minDay ?content))
            )
        :effect 
            (and
                (asignedContent ?content)
                (forall (?content2 - Content)
                    (when (predecessor ?content ?content2)
                        (and
                            (decrease (predecessorsToAsign ?content2) 1)
                            (increase (minDay ?content2) (- (numDay ?day) (minDay ?content2)))
                        )
                    )
                )
            )
    )
)