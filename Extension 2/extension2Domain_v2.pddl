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
        (parallel ?C1 - Content ?C2 -Content)
        (visualizationDay ?C - Content ?D - Day)
        (asignedContent ?C - Content)
        (desiredContent ?C - Content)
	(twoDays ?C - Content)
    )

    (:functions
        (predecessorsToAsign ?content - Content)
        (numDay ?D - Day)
        (maxDay ?C - Content)
        (parallelDay ?C - Content)
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
        :parameters (?content - Content ?day - Day)
        :precondition 
        (and
            (not (asignedContent ?content))
            (desiredContent ?content)
            (= (predecessorsToAsign ?content) 0)
            (> (numDay ?day) (maxDay ?content))
            (or
                (= (parallelDay ?content) 0)
                (= (parallelDay ?content) (numDay ?day))
                (= (+ (parallelDay ?content) 1) (numDay ?day))
            )
        )
        :effect 
        (and
            (asignedContent ?content)
            (forall (?content2 - Content)
                (when (predecessor ?content ?content2)
                    (decrease (predecessorsToAsign ?content2) 1)
                )
            )
            (forall (?content3 - Content)
                (when (and (predecessor ?content ?content3) (> (numDay ?day) (maxDay ?content3)))
                    (assign (maxDay ?content3) (numDay ?day))
                )
            )
            (forall (?content4 - Content)
                (when (and (parallel ?content ?content4) (= (parallelDay ?content4) 0))
                    (assign (parallelDay ?content4) (numDay ?day))
                )
            )
        )
    )
)
