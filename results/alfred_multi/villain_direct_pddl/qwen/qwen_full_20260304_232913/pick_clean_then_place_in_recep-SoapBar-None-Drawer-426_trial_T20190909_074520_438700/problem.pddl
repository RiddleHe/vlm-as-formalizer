(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        sink1 - sink
        drawer1 - receptacle
        soap1 - object
        soap2 - object
        knife1 - knife
        toilet_paper1 - object
        bottle1 - object
    )
    (:init
        (atLocation agent1 sink1)
        (inReceptacle soap1 sink1)
        (inReceptacle soap2 drawer1)
        (openable drawer1)
        (opened drawer1)
        (isClean soap1)
    )
    (:goal (and (inReceptacle soap1 drawer1)))
)