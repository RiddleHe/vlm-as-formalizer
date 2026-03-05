(define (problem put_cold_bowl_in_cabinet)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        left_sink
        right_sink
        knife_on_counter
        wooden_cabinet_above_fridge
        wooden_cabinet_left
        wooden_cabinet_right
        bowl_in_left_sink
        egg_in_right_sink
        toaster
    )
    (:init
        (openable wooden_cabinet_above_fridge)
        (openable wooden_cabinet_left)
        (openable wooden_cabinet_right)
        (opened wooden_cabinet_left)
        (inReceptacle bowl_in_left_sink left_sink)
        (inReceptacle egg_in_right_sink right_sink)
        (atLocation agent wooden_cabinet_left) ; assuming agent starts near an open cabinet for initial state consistency
    )
    (:goal (and
        (inReceptacle bowl_in_left_sink wooden_cabinet_above_fridge)
        (isCool bowl_in_left_sink)
    ))
)