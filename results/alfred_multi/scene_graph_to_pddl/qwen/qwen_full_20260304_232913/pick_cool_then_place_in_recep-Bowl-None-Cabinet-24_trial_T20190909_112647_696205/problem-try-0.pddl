(define (problem put_cold_bowl_in_cabinet)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife
        cabinet_under_sink
        cabinet_above_fridge
        bowl
        egg
        wine_glass
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable cabinet_under_sink)
        (openable cabinet_above_fridge)
        (opened cabinet_under_sink)
        (inReceptacle bowl sink)
        (inReceptacle egg sink)
        (atLocation agent microwave) ; initial location can be arbitrary as long as not at target; here we pick microwave
    )
    (:goal
        (and
            (inReceptacle bowl cabinet_above_fridge)
            (isCool bowl)
        )
    )
)