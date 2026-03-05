(define (problem put_chilled_potato_on_island)
    (:domain put_task)
    (:objects
        agent1 - agent
        potato - object
        fridge - fridge
        island - receptacle
        knife - knife
    )
    (:init
        (atLocation agent1 island)
        (openable fridge)
        (not (opened fridge))
        (not (holdsAny agent1))
        (not (isCool potato))
    )
    (:goal
        (and
            (inReceptacle potato island)
            (isCool potato)
        )
    )
)