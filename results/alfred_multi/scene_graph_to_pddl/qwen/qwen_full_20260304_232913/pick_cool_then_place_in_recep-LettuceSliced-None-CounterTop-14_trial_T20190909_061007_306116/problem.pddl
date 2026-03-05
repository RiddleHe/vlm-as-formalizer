(define (problem put_slice_cold_lettuce_on_counter)
    (:domain put_task)
    (:objects
        robot - agent
        stainless_steel_fridge - fridge
        stainless_steel_sink - sink
        coffee_maker - receptacle
        toaster - receptacle
        stove - receptacle
        egg - object
        spoon - object
        black_mug - object
        lettuce - object
        fork - object
        spatula - object
        bread - object
        green_cutting_board - object
        golden_ladle - object
        black_handled_knife - knife
        golden_handled_knife - knife
        stainless_steel_pot - object
    )
    (:init
        (openable stainless_steel_fridge)
        (openable stainless_steel_sink)
        (opened stainless_steel_sink)
        (isOn coffee_maker)
        (isOn toaster)
        (isOn stove)
        (inReceptacle egg stainless_steel_sink)
        (inReceptacle spoon stainless_steel_sink)
        (inReceptacle black_mug coffee_maker)
        (atLocation robot stainless_steel_sink) ; assuming robot starts near sink for accessibility
    )
    (:goal (and
        (isSliced lettuce)
        (isCool lettuce)
        (atLocation robot lettuce) ; lettuce is now on counter (dining table is treated as counter surface)
    ))
)