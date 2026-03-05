(define (problem put_frying_pan_with_fork_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        round_table - receptacle
        kitchen_counter - receptacle
        knife_with_yellow_handle - knife
        potato - object
        green_vegetable - object
        bottle - object
        paper_towel_roll - object
        small_green_box - object
        egg - object
        bread - object
        spatula - object
    )
    (:init
        (inReceptacle potato round_table)
        (inReceptacle green_vegetable round_table)
        (inReceptacle bottle round_table)
        (inReceptacle paper_towel_roll round_table)
        (inReceptacle small_green_box round_table)
        (inReceptacle egg round_table)
        (inReceptacle bread kitchen_counter)
        (inReceptacle spatula kitchen_counter)
        (atLocation robot kitchen_counter) ; assuming robot starts near counter
    )
    (:goal
        (and
            (inReceptacle spatula round_table)
        )
    )
)