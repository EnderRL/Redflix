﻿(define (domain redflix)

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
        (visualizationDay ?C - Content ?D - Day)
        (asignedContent ?C - Content)
    )

    (:functions
        (predecessorsToAsign ?content - Content)
        (numDay ?D - Day)
    )

    (:action asignContentToDay
        :parameters (?content - Content ?day - Day)
        :precondition (and 
			(not (asignedContent ?content))
			(= (predecessorsToAsign ?content) 0)
			(forall (?contentToCheck - Content ?dayToCheck - Day) 
			   (imply (and (predecessor ?contentToCheck ?content) (visualizationDay ?contentToCheck ?dayToCheck)) (< (numDay ?dayToCheck) (numDay ?day)))
			)
		      )
        :effect 
            (and  
		(asignedContent ?content)
		(visualizationDay ?content ?day)
                (forall (?content2 - Content)
                    (when (predecessor ?content ?content2)
                        (decrease (predecessorsToAsign ?content2) 1)
                    )
                )
            )
    )
)