(define (problem put_clean_teapot_on_stove)
    (:domain put_task)
    (:objects
        robot - agent
        double_basin_sink - sink
        stove_top - receptacle
        counter_top - receptacle
        tea_pot_with_blue_handle - object
        fork_on_counter - object
        pot_on_stove_left - object
        microwave - microwave
        fridge - fridge
        knife - knife
    )
    (:init
        (openable double_basin_sink)
        (isOn stove_top)
        (inReceptacle tea_pot_with_blue_handle stove_top)
        (inReceptacle pot_on_stove_left stove_top)
        (inReceptacle fork_on_counter counter_top)
    )
    (:goal (and
        (isClean tea_pot_with_blue_handle)
        (inReceptacle tea_pot_with_blue_handle stove_top)
    ))
)