(define (problem put_mug_with_spoon_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        mug - object
        spoon - object
        table - receptacle
        side_table - receptacle
        sink - sink
        microwave - microwave
        fridge - fridge
        knife - knife
    )
    (:init
        (atLocation robot side_table)
        (inReceptacle mug side_table)
        (inReceptacle spoon side_table)
        (openable side_table)
        (opened side_table)
        (openable table)
        (not (opened table))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle mug table)
            (inReceptacle spoon table)
        )
    )
)