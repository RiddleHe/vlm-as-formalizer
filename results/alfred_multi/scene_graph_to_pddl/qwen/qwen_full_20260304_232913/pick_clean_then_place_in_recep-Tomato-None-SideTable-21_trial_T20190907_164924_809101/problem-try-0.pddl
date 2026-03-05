(define (problem put_washed_tomato_on_table)
    (:domain put_task)
    (:objects
        agent
        black_fridge - fridge
        kitchen_sink - sink
        black_table - receptacle
        knife - object
        tomato - object
        lettuce - object
        salt_shaker - object
        bowl - object
        black_trash_bag - object
    )
    (:init
        (openable black_fridge)
        (openable kitchen_sink)
        (inReceptacle tomato kitchen_sink)
        (inReceptacle lettuce kitchen_sink)
        (inReceptacle bowl black_table)
        (inReceptacle salt_shaker black_table)
        (inReceptacle black_trash_bag black_table)
        (atLocation agent black_table) ; assuming agent starts near black table for initial action
    )
    (:goal (and
        (inReceptacle tomato black_table)
        (isClean tomato)
    ))
)