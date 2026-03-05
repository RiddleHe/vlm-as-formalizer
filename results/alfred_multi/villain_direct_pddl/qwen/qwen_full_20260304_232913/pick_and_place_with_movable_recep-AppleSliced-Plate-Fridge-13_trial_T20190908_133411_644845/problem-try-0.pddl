(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        fridge1 - fridge
        sink1 - sink
        knife1 - knife
        plate1 - receptacle
        apple1 - object
        bowl1 - receptacle
        lettuce1 - object
        bread1 - object
        cup1 - receptacle
        cup2 - receptacle
        saltshaker1 - object
        pan1 - object
    )
    (:init
        (openable fridge1)
        (openable microwave1)
        (atLocation agent1 microwave1)
        (inReceptacle cup1 microwave1)
        (inReceptacle cup2 microwave1)
        (inReceptacle apple1 microwave1)
        (inReceptacle plate1 counter1)
        (inReceptacle knife1 counter1)
        (inReceptacle lettuce1 counter1)
        (inReceptacle bread1 counter1)
        (inReceptacle bowl1 counter1)
        (inReceptacle saltshaker1 counter1)
        (inReceptacle pan1 stove1)
    )
    (:goal
        (and
            (inReceptacle plate1 fridge1)
            (inReceptacle knife1 plate1)
            (inReceptacle apple1 plate1)
        )
    )
)