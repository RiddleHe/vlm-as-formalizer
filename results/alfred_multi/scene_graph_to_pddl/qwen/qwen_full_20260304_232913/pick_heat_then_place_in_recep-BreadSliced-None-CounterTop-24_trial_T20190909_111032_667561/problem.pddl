(define (problem put_warm_slice_of_bread)
    (:domain put_task)
    (:objects
        robot - agent
        red_microwave - microwave
        white_fridge - fridge
        left_sink_basin - sink
        right_sink_basin - sink
        golden_trash_can - receptacle
        wooden_cabinet_under_sink - receptacle
        yellow_handled_knife - knife
        black_handled_knife - knife
        wine_glass - object
        salt_shaker - object
        apple - object
        toaster - object
        plate_inside_microwave - object
    )
    (:init
        (openable red_microwave)
        (openable white_fridge)
        (openable golden_trash_can)
        (opened red_microwave)
        (isOn red_microwave)
        (isToggled red_microwave)
        (inReceptacle plate_inside_microwave red_microwave)
        (atLocation robot red_microwave)
    )
    (:goal
        (and
            (inReceptacle apple wooden_cabinet_under_sink)
            (isSliced apple)
            (isHot apple)
        )
    )
)