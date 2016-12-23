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
    )

    (:functions
        (predecessorsToAsign ?content - Content)
        (numDay ?D - Day)
        (minDay ?D - Day)
        (minContent ?C - Content)
    )

    (:action asignContentToDay
        :parameters (?content - Content ?day - Day)
        :precondition (and 
			(not (asignedContent ?content))
			(= (predecessorsToAsign ?content) 0)
			(<= (+ (minDay ?day) (minContent ?content)) 200)
			(forall (?contentToCheck - Content ?dayToCheck - Day) 
			   (and 
			    (imply (and (predecessor ?contentToCheck ?content) (visualizationDay ?contentToCheck ?dayToCheck)) (< (numDay ?dayToCheck) (numDay ?day)))
			    (imply (and (or (parallel ?contentToCheck ?content) (parallel ?content ?contentToCheck)) (visualizationDay ?contentToCheck ?dayToCheck)) 
				   (or 
				     (= (numDay ?dayToCheck) (numDay ?day)) 
				     (= (+ (numDay ?dayToCheck) 1) (numDay ?day))
				     (= (+ (numDay ?day) 1) (numDay ?dayToCheck))
				   )
			    )
			   )
			)
		      )
        :effect 
            (and  
		(increase (minDay ?day) (minContent ?content))
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