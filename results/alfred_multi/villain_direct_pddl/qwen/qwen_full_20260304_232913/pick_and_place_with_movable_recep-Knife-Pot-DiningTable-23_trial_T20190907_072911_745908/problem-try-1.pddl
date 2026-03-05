(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        table - receptacle
        pan - object
        knife - knife
    )
    (:init
        (atLocation agent1 table)
        (inReceptacle pan table)
        (inReceptacle knife table)
    )
    (:goal
        (and
            (inReceptacle knife pan)
            (inReceptacle pan table)
        )
    )
)