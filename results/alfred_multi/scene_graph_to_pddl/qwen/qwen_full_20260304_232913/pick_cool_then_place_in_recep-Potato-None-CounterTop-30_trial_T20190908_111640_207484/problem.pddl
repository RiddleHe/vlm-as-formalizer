(define (problem put_chilled_potato_on_island)
    (:domain put_task)
    (:objects
        robot - agent
        black_microwave - microwave
        black_fridge - fridge
        wooden_countertop_island - receptacle
        yellow_handled_knife - knife
        brown_loaf_of_bread - object
        green_lettuce - object
        dark_brown_potato - object
        silver_bottle_with_red_cap - object
        wooden_cup - object
    )
    (:init
        (openable black_microwave)
        (openable black_fridge)
        (inReceptacle brown_loaf_of_bread wooden_countertop_island)
        (inReceptacle green_lettuce wooden_countertop_island)
        (inReceptacle dark_brown_potato wooden_countertop_island)
        (inReceptacle silver_bottle_with_red_cap wooden_countertop_island)
        (inReceptacle wooden_cup wooden_countertop_island)
        (inReceptacle yellow_handled_knife wooden_countertop_island)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle dark_brown_potato wooden_countertop_island)
        (isCool dark_brown_potato)
    ))
)