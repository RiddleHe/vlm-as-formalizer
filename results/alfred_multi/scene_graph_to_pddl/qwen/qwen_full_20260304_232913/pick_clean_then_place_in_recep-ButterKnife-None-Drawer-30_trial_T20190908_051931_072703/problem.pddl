(define (problem put_clean_knife_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        kitchen_sink - sink
        wooden_cabinet_drawer - receptacle
        silver_knife_on_table - knife
        silver_knife_in_sink - knife
        loaf_of_bread - object
        green_pepper - object
        yellow_apple - object
        wooden_bowl - object
        silver_spoon - object
        black_smartphone - object
        potted_plant - object
        red_tomato - object
        black_tray - object
    )
    (:init
        (openable kitchen_sink)
        (openable wooden_cabinet_drawer)
        (inReceptacle silver_knife_in_sink kitchen_sink)
        (not (holdsAny robot))
        (not (isClean silver_knife_on_table))
        (not (isClean silver_knife_in_sink))
        (not (atLocation robot kitchen_sink))
        (not (atLocation robot wooden_cabinet_drawer))
        (not (atLocation robot silver_knife_on_table))
        (not (atLocation robot silver_knife_in_sink))
    )
    (:goal (and
        (inReceptacle silver_knife_in_sink wooden_cabinet_drawer)
        (isClean silver_knife_in_sink)
    ))
)