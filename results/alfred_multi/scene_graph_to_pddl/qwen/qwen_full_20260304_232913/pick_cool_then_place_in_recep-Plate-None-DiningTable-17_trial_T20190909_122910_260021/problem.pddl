(define (problem put_chilled_plate_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife_on_table - knife
        table - receptacle
        bread - object
        tomato - object
        lettuce - object
        salt_shaker - object
        pepper_shaker - object
        fork - object
        spoon - object
        plate - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (openable sink)
        (inReceptacle bread table)
        (inReceptacle tomato table)
        (inReceptacle lettuce table)
        (inReceptacle salt_shaker table)
        (inReceptacle pepper_shaker table)
        (inReceptacle fork table)
        (inReceptacle spoon table)
        (inReceptacle knife_on_table table)
        (inReceptacle plate table)
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle plate table)
            (isCool plate)
        )
    )
)