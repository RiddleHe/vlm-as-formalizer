(define (problem chill_apple)
    (:domain put_task)
    (:objects
        agent1 - agent
        fridge1 - fridge
        table1 - receptacle
        apple1 - object
        knife1 - knife
    )
    (:init
        (openable fridge1)
        (not (opened fridge1))
        (atLocation agent1 table1)
        (inReceptacle apple1 table1)
        (inReceptacle knife1 table1)
    )
    (:goal
        (and
            (inReceptacle apple1 table1)
            (isCool apple1)
        )
    )
)