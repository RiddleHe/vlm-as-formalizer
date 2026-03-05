(define (problem clean_spoon)
    (:domain put_task)
    (:objects
        robot - agent
        spoon - object
        sink - sink
        microwave - microwave
        fridge - fridge
        knife - knife
        countertop - receptacle
    )
    (:init
        (atLocation robot countertop)
        (inReceptacle spoon countertop)
        (openable sink)
        (openable microwave)
        (openable fridge)
        (not (isClean spoon))
    )
    (:goal
        (and
            (isClean spoon)
            (inReceptacle spoon countertop)
        )
    )
)