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
        (desiredContent ?C - Content)
    )

    (:functions
    )
    
   
    
    (:action makeDesired
        :parameters (?content - Content)
        :precondition (and (desiredContent ?content) (> (predecessorsToAsign ?content) 0))
        :effect 
            (forall (?content2 - Content)
                (when (predecessor ?content2 ?content)
                    (desiredContent ?content2)
                )
            )
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
