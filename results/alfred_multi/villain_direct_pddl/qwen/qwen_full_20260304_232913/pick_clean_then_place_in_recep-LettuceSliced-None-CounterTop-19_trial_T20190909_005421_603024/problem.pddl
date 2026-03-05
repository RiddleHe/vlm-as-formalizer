(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        sink1 - sink
        counter1 - receptacle
        knife1 - knife
        lettuce1 - object
    )
    (:init
        (atLocation agent1 counter1)
        (inReceptacle lettuce1 counter1)
        (inReceptacle knife1 counter1)
        (openable sink1)
        (not (opened sink1))
        (not (isClean lettuce1))
        (not (isSliced lettuce1))
    )
    (:goal
        (and
            (inReceptacle lettuce1 counter1)
            (isClean lettuce1)
            (isSliced lettuce1)
        )
    )
)