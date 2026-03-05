(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        table - receptacle
        pan1 - object
        knife1 - knife
    )
    (:init
        (atLocation agent1 table)
        (inReceptacle pan1 table)
        (inReceptacle knife1 table)
    )
    (:goal (and
        (inReceptacle knife1 pan1)
        (inReceptacle pan1 table)
    ))
)