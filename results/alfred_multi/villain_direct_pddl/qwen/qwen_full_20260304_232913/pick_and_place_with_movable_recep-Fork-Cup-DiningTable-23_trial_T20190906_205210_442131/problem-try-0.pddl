(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        cup1 - object
        fork1 - object
        kitchen_island - receptacle
        sink1 - sink
        stove1 - receptacle
        fridge1 - fridge
        microwave1 - microwave
        knife1 - knife
        cabbage1 - object
        cabbage2 - object
        bowl1 - object
        bowl2 - object
        coffee_maker1 - object
        trash_can1 - receptacle
        table1 - receptacle
    )
    (:init
        (atLocation agent1 kitchen_island)
        (inReceptacle cup1 kitchen_island)
        (inReceptacle fork1 kitchen_island)
        (openable fridge1)
        (openable microwave1)
        (openable sink1)
        (isClean fork1)
        (isClean cup1)
    )
    (:goal
        (and
            (inReceptacle cup1 kitchen_island)
            (inReceptacle fork1 cup1)
        )
    )
)