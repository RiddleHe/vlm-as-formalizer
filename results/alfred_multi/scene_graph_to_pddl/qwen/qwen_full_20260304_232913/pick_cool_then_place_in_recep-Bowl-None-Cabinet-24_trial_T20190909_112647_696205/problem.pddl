(define (problem put_cold_bowl_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        black_microwave - microwave
        dark_refrigerator - fridge
        double_sink - sink
        silver_knife - knife
        wooden_cabinet_under_sink - receptacle
        wooden_cabinet_above_fridge - receptacle
        silver_bowl - object
        brown_egg - object
        black_toaster - object
    )
    (:init
        (openable wooden_cabinet_under_sink)
        (openable wooden_cabinet_above_fridge)
        (openable dark_refrigerator)
        (opened wooden_cabinet_under_sink)
        (inReceptacle silver_bowl double_sink)
        (inReceptacle brown_egg double_sink)
        (atLocation robot black_microwave)
    )
    (:goal
        (and
            (inReceptacle silver_bowl wooden_cabinet_above_fridge)
            (isCool silver_bowl)
        )
    )
)