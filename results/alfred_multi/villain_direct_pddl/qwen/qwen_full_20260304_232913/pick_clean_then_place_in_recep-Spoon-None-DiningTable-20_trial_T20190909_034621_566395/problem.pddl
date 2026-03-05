(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        sink1 - sink
        spoon1 - object
        table1 - object
    )
    (:init
        (atLocation agent1 sink1)
        (inReceptacle spoon1 sink1)
        (not (isClean spoon1))
    )
    (:goal
        (and
            (atLocation agent1 table1)
            (not (holdsAny agent1))
            (isClean spoon1)
        )
    )
)