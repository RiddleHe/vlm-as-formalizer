(define (problem put_rinsed_cloth_in_cabinet)
    (:domain put_task)
    (:objects
        agent1 - agent
        sink1 - sink
        cabinet1 - receptacle
        cloth1 - object
        soap1 - object
    )
    (:init
        (atLocation agent1 sink1)
        (inReceptacle cloth1 sink1)
        (inReceptacle soap1 sink1)
        (openable cabinet1)
        (not (opened cabinet1))
        (not (isClean cloth1))
    )
    (:goal
        (and
            (inReceptacle cloth1 cabinet1)
            (isClean cloth1)
        )
    )
)