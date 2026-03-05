(define (problem put_chilled_plate_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        table - receptacle
        fridge - receptacle
        plate - object
        knife - knife
        tomato - object
        lettuce - object
        saltshaker - object
        fork - object
        spoon - object
    )
    (:init
        (openable fridge)
        (not (opened fridge))
        (atLocation agent1 table)
        (inReceptacle plate table)
        (inReceptacle knife table)
        (inReceptacle tomato table)
        (inReceptacle lettuce table)
        (inReceptacle saltshaker table)
        (inReceptacle fork table)
        (inReceptacle spoon table)
        (not (holdsAny agent1))
    )
    (:goal
        (and
            (inReceptacle plate table)
            (isCool plate)
        )
    )
)