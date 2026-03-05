(define (problem put_pot_on_stove)
    (:domain put_task)
    (:objects
        robot - agent
        stainless_steel_sink - sink
        oven_door - receptacle
        countertop - receptacle
        stove_top - receptacle
        stainless_steel_pot_with_water - object
        stainless_steel_pot_empty - object
        white_ceramic_mug - object
        knife_on_countertop - knife
    )
    (:init
        (openable stainless_steel_sink)
        (openable oven_door)
        (isOn stove_top)
        (inReceptacle stainless_steel_pot_with_water stove_top)
        (inReceptacle stainless_steel_pot_empty stove_top)
        (inReceptacle white_ceramic_mug countertop)
        (inReceptacle knife_on_countertop countertop)
        (not (atLocation robot stainless_steel_sink))
        (not (atLocation robot oven_door))
        (not (atLocation robot countertop))
        (not (atLocation robot stove_top))
        (not (atLocation robot stainless_steel_pot_with_water))
        (not (atLocation robot stainless_steel_pot_empty))
        (not (atLocation robot white_ceramic_mug))
        (not (atLocation robot knife_on_countertop))
        (not (holdsAny robot))
        (not (opened stainless_steel_sink))
        (not (opened oven_door))
        (not (isClean stainless_steel_pot_with_water))
        (not (isClean stainless_steel_pot_empty))
        (not (isHot stainless_steel_pot_with_water))
        (not (isHot stainless_steel_pot_empty))
        (not (isCool stainless_steel_pot_with_water))
        (not (isCool stainless_steel_pot_empty))
        (not (isSliced stainless_steel_pot_with_water))
        (not (isSliced stainless_steel_pot_empty))
        (not (isToggled stove_top))
    )
    (:goal (and
        (inReceptacle stainless_steel_pot_with_water stove_top)
    ))
)