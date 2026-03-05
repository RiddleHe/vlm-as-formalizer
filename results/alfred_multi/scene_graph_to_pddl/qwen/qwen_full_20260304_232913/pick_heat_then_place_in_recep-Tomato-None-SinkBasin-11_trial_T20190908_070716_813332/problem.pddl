(define (problem put_heated_tomato_in_sink)
    (:domain put_task)
    (:objects
        robot - agent
        red_microwave - microwave
        stainless_steel_sink - sink
        black_handled_knife - knife
        silver_pot - object
        roll_of_paper_towels - object
        loaf_of_bread - object
        tomato1 - object
        tomato2 - object
        wooden_cabinet_under_countertop - receptacle
        black_stovetop - receptacle
    )
    (:init
        (openable red_microwave)
        (openable stainless_steel_sink)
        (opened red_microwave)
        (isOn black_stovetop)
        (inReceptacle silver_pot black_stovetop)
        (inReceptacle roll_of_paper_towels wooden_cabinet_under_countertop)
        (inReceptacle loaf_of_bread wooden_cabinet_under_countertop)
        (inReceptacle tomato1 wooden_cabinet_under_countertop)
        (inReceptacle tomato2 wooden_cabinet_under_countertop)
        (inReceptacle black_handled_knife wooden_cabinet_under_countertop)
    )
    (:goal (and
        (inReceptacle tomato1 stainless_steel_sink)
        (isHot tomato1)
    ))
)