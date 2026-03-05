(define (problem place_chilled_lettuce)
    (:domain put_task)
    (:objects
        robot - agent
        fridge - fridge
        table - receptacle
        lettuce1 lettuce2 - object
        knife - knife
    )
    (:init
        (openable fridge)
        (not (opened fridge))
        (inReceptacle lettuce1 fridge)
        (atLocation robot table)
        (not (isCool lettuce1))
        (not (isSliced lettuce1))
    )
    (:goal
        (and
            (inReceptacle lettuce1 table)
            (isCool lettuce1)
        )
    )
)