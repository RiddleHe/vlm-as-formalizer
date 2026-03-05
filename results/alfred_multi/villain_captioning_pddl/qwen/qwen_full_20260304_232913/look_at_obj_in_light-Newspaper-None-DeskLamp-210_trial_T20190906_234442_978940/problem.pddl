(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        newspaper - object
        lamp - object
        sofa - receptacle
        side_table - receptacle
        laptop - object
        pillow - object
        chair - object
        rug - object
    )
    (:init
        (atLocation agent1 rug)  ; agent starts on the rug (or not at any object, so we pick a neutral location)
        (inReceptacle newspaper sofa)
        (inReceptacle lamp side_table)
        (inReceptacle laptop sofa)
        (inReceptacle pillow sofa)
        (not (isOn lamp))
        (not (holdsAny agent1))
        (not (opened sofa))  ; sofa is not openable, but we include for completeness
        (not (opened side_table))  ; side_table is not openable
        (not (isClean newspaper))
        (not (isHot newspaper))
        (not (isCool newspaper))
        (not (isSliced newspaper))
    )
    (:goal (and
        (holds agent1 newspaper)
        (isOn lamp)
    ))
)