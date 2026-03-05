(define (problem put_toilet_paper_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        gray_sink - sink
        wooden_cabinet_second_from_left_under_sink - receptacle
        black_trash_can - receptacle
        roll_of_toilet_paper - object
        empty_roll_of_toilet_paper - object
        purple_cloth - object
        green_spray_bottle_1 - object
        green_spray_bottle_2 - object
        white_toilet - object
    )
    (:init
        (openable wooden_cabinet_second_from_left_under_sink)
        (not (opened wooden_cabinet_second_from_left_under_sink))
        (inReceptacle roll_of_toilet_paper gray_sink)
        (inReceptacle empty_roll_of_toilet_paper gray_sink)
        (not (holdsAny robot))
        (not (atLocation robot gray_sink))
        (not (atLocation robot wooden_cabinet_second_from_left_under_sink))
    )
    (:goal (and
        (inReceptacle roll_of_toilet_paper wooden_cabinet_second_from_left_under_sink)
        (inReceptacle empty_roll_of_toilet_paper wooden_cabinet_second_from_left_under_sink)
    ))
)