(define (problem put_pot_on_stove)
    (:domain put_task)
    (:objects
        robot - agent
        stainless_steel_sink - sink
        stove_top - receptacle
        countertop - receptacle
        stainless_steel_pot_with_water - object
        stainless_steel_pot_empty - object
        white_mug - object
        knife_on_countertop - knife
    )
    (:init
        (openable stainless_steel_sink)
        (isOn stove_top)
        (inReceptacle stainless_steel_pot_with_water stove_top)
        (inReceptacle stainless_steel_pot_empty stove_top)
        (inReceptacle white_mug countertop)
    )
    (:goal (and (inReceptacle stainless_steel_pot_with_water stove_top)))
)