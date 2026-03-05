(define (problem put_plate_with_spoon_on_counter)
    (:domain put_task)
    (:objects
        agent
        dark_brown_microwave - microwave
        dark_gray_fridge - fridge
        gray_marble_sink - sink
        yellow_handled_knife - knife
        gray_marble_counter - receptacle
        wooden_cabinet - receptacle
        large_metal_spoon - object
        green_object - object
    )
    (:init
        (openable dark_gray_fridge)
        (openable dark_brown_microwave)
        (inReceptacle large_metal_spoon gray_marble_sink)
        (inReceptacle yellow_handled_knife gray_marble_sink)
        (inReceptacle green_object gray_marble_sink)
    )
    (:goal (and
        (inReceptacle large_metal_spoon gray_marble_counter)
    ))
)