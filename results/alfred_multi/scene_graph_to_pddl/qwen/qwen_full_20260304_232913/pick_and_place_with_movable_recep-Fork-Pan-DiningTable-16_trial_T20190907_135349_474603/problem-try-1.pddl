(define (problem put_frying_pan_with_fork_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        round_table - receptacle
        wooden_countertop - receptacle
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        yellow_handled_knife - knife
        green_vegetable - object
        potato - object
        bottle - object
        egg - object
        paper_towel_roll - object
        small_green_box - object
        fork - object
        loaf_of_bread - object
        spatula - object
    )
    (:init
        (inReceptacle yellow_handled_knife round_table)
        (inReceptacle green_vegetable round_table)
        (inReceptacle potato round_table)
        (inReceptacle bottle round_table)
        (inReceptacle egg round_table)
        (inReceptacle paper_towel_roll round_table)
        (inReceptacle small_green_box round_table)
        (inReceptacle fork round_table)
        (inReceptacle loaf_of_bread wooden_countertop)
        (inReceptacle spatula wooden_countertop)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle fork round_table)
    ))
)