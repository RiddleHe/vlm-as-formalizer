(define (problem move_remotes_to_chair)
    (:domain put_task)
    (:objects
        robot - agent
        remote_control_1 - object
        remote_control_2 - object
        black_sofa - receptacle
        brown_leather_armchair - receptacle
        green_cushion - object
        smartphone - object
        newspaper - object
        cardboard_box - receptacle
        golden_statue - object
        golden_cup - object
        dark_wooden_side_table - receptacle
        fireplace - object
        rug - object
        wooden_floor - object
        window - object
    )
    (:init
        (atLocation robot black_sofa)
        (inReceptacle remote_control_1 black_sofa)
        (inReceptacle remote_control_2 black_sofa)
        (inReceptacle green_cushion black_sofa)
        (inReceptacle smartphone black_sofa)
        (inReceptacle newspaper black_sofa)
        (inReceptacle golden_statue dark_wooden_side_table)
        (inReceptacle golden_cup dark_wooden_side_table)
        (openable cardboard_box)
        (opened cardboard_box)
    )
    (:goal
        (and
            (inReceptacle remote_control_1 brown_leather_armchair)
            (inReceptacle remote_control_2 brown_leather_armchair)
        )
    )
)