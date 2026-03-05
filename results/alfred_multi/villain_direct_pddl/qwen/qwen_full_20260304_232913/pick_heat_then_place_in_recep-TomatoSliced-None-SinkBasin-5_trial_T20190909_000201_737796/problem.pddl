(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        sink1 - sink
        tomato1 - object
        knife1 - knife
    )
    (:init
        (atLocation agent1 microwave1)
        (openable microwave1)
        (not (opened microwave1))
        (inReceptacle tomato1 microwave1)
        (inReceptacle knife1 microwave1)
        (not (isHot tomato1))
        (not (isSliced tomato1))
        (not (isClean tomato1))
        (not (holdsAny agent1))
    )
    (:goal
        (and
            (inReceptacle tomato1 sink1)
            (isHot tomato1)
            (isSliced tomato1)
        )
    )
)