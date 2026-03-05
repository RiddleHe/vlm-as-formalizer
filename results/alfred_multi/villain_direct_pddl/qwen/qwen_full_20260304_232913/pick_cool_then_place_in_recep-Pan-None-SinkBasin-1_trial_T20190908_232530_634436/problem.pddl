(define (problem chill_pan_and_put_in_sink)
    (:domain put_task)
    (:objects
        agent1 - agent
        fridge1 - fridge
        sink1 - sink
        pan1 - object
    )
    (:init
        (openable fridge1)
        (not (opened fridge1))
        (atLocation agent1 pan1)
        (not (isCool pan1))
        (not (holdsAny agent1))
        (not (atLocation agent1 fridge1))
        (not (atLocation agent1 sink1))
    )
    (:goal (and
        (inReceptacle pan1 sink1)
        (isCool pan1)
    ))
)