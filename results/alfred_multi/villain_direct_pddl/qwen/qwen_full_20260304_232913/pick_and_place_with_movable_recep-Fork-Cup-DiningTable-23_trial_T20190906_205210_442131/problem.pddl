(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        cup - object
        fork - object
        kitchen_island - receptacle
        sink - sink
        fridge - fridge
        microwave - microwave
        stove - receptacle
        countertop - receptacle
        table - receptacle
    )
    (:init
        (atLocation robot countertop)
        (inReceptacle cup countertop)
        (inReceptacle fork countertop)
        (openable sink)
        (openable fridge)
        (openable microwave)
        (isClean cup)
        (isClean fork)
    )
    (:goal
        (and
            (inReceptacle cup kitchen_island)
            (inReceptacle fork cup)
        )
    )
)