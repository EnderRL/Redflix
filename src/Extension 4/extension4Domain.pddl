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
        (asignedContent ?C - Content)
        (desiredContent ?C - Content)
    )

    (:functions
        (predecessorsToAsign ?content - Content)
        (numDay ?D - Day)
        (maxDay ?C - Content)
        (dayContent ?C - Content)
        (minDay ?D - Day)
        (minContent ?C - Content)
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
            (<= (+ (minDay ?day) (minContent ?content)) 200)
            (> (numDay ?day) (maxDay ?content))
            (forall (?contentToCheck - Content) 
                (imply (and (parallel ?contentToCheck ?content) (asignedContent ?contentToCheck)) 
                    (or 
                        (= (dayContent ?contentToCheck) (numDay ?day)) 
                        (= (+ (dayContent ?contentToCheck) 1) (numDay ?day))
                        (= (dayContent ?contentToCheck) (+ (numDay ?day) 1))
                    )
                )
            )
        )
        :effect 
        (and  
            (increase (minDay ?day) (minContent ?content))
            (asignedContent ?content)
            (assign (dayContent ?content) (numDay ?day))
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
	)
    )
)
