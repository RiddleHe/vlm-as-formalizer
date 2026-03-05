(define (problem put_plunger_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        brown_marble_sink - sink
        wooden_cabinet_under_sink - receptacle
        plunger - object
        toilet - object
        toilet_brush - object
        black_toilet_paper_holder - object
    )
    (:init
        (openable wooden_cabinet_under_sink)
        (not (opened wooden_cabinet_under_sink))
        (not (atLocation robot plunger))
        (not (atLocation robot wooden_cabinet_under_sink))
        (not (holdsAny robot))
        (not (inReceptacle plunger wooden_cabinet_under_sink))
        (atLocation robot toilet) ; assuming robot starts near toilet as plunger is beside it
    )
    (:goal
        (and
            (inReceptacle plunger wooden_cabinet_under_sink)
        )
    )
)