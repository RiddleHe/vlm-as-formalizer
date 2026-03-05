(define (problem put_washed_tomato_on_table)
    (:domain put_task)
    (:objects
        agent
        black_fridge - fridge
        silver_sink - sink
        black_table - receptacle
        black_trash_bag - receptacle
        brown_tomato - object
        green_lettuce - object
        brown_bowl - object
        salt_shaker - object
        knife_with_yellow_handle - knife
        brown_egg - object
    )
    (:init
        (openable black_fridge)
        (openable silver_sink)
        (not (opened black_fridge))
        (not (opened silver_sink))
        (not (holdsAny agent))
        (not (isClean brown_tomato))
        (not (isHot brown_tomato))
        (not (isCool brown_tomato))
        (not (isOn brown_tomato))
        (not (isToggled brown_tomato))
        (not (isSliced brown_tomato))
        (inReceptacle green_lettuce silver_sink)
        (inReceptacle knife_with_yellow_handle silver_sink)
        (inReceptacle brown_egg silver_sink)
        (inReceptacle brown_tomato black_table)
        (inReceptacle brown_bowl black_table)
        (inReceptacle salt_shaker black_table)
        (atLocation agent black_table)  ; Starting location can be arbitrary; we set it to black_table for simplicity
    )
    (:goal (and
        (inReceptacle brown_tomato black_table)
        (isClean brown_tomato)
    ))
)