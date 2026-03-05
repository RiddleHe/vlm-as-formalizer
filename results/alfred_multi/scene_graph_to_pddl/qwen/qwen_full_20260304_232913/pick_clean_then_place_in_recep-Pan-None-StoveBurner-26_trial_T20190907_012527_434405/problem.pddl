(define (problem rinse_pan)
    (:domain put_task)
    (:objects
        robot - agent
        microwave_oven_with_plate_inside - microwave
        stainless_steel_sink - sink
        stove_top_with_burners - receptacle
        dirty_square_pan - object
        brown_paper_bag - object
        egg - object
        plate_inside_microwave - object
    )
    (:init
        (openable microwave_oven_with_plate_inside)
        (openable stainless_steel_sink)
        (opened microwave_oven_with_plate_inside)
        (isOn stove_top_with_burners)
        (inReceptacle plate_inside_microwave microwave_oven_with_plate_inside)
        (inReceptacle dirty_square_pan stove_top_with_burners)
    )
    (:goal (and (isClean dirty_square_pan)))
)