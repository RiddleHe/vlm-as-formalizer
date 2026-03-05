(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        lettuce1 - object
        lettuce2 - object
        spoon - object
        egg - object
        fork - object
        cup1 - object
        cup2 - object
        bowl1 - object
        bowl2 - object
        stove - object
        kitchen_island - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (opened fridge)
        (isOn microwave)
        (isOn stove)
        (atLocation robot kitchen_island)
        (inReceptacle spoon sink)
        (inReceptacle egg sink)
        (inReceptacle cup2 kitchen_island) ; cup under kitchen island
        (inReceptacle bowl1 stove)
        (inReceptacle bowl2 kitchen_island)
        (atLocation robot kitchen_island)
    )
    (:goal
        (and
            (inReceptacle fork cup1)
            (inReceptacle cup1 kitchen_island)
        )
    )
)