(define (problem put_frying_pan_with_fork_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        round_table - receptacle
        tiled_counter - receptacle
        frying_pan - object
        fork - object
        knife1 - knife
        knife2 - knife
        green_bottle - object
        potato - object
        paper_towel_roll - object
        cucumber1 - object
        cucumber2 - object
        egg - object
        green_box - object
        loaf_of_bread - object
        spatula - object
    )
    (:init
        (atLocation robot round_table)
        (inReceptacle knife1 round_table)
        (inReceptacle green_bottle round_table)
        (inReceptacle potato round_table)
        (inReceptacle paper_towel_roll round_table)
        (inReceptacle cucumber1 round_table)
        (inReceptacle cucumber2 round_table)
        (inReceptacle egg round_table)
        (inReceptacle green_box round_table)
        (inReceptacle knife2 tiled_counter)
        (inReceptacle loaf_of_bread tiled_counter)
        (inReceptacle spatula tiled_counter)
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle fork frying_pan)
            (inReceptacle frying_pan round_table)
        )
    )
)