(define (problem put_cold_bowl_in_cabinet)
    (:domain put_task)
    (:objects
        agent1 - agent
        sink1 - sink
        fridge1 - fridge
        cabinet_upper1 - receptacle
        bowl1 - object
        knife1 - knife
    )
    (:init
        (openable sink1)
        (openable fridge1)
        (openable cabinet_upper1)
        (inReceptacle bowl1 sink1)
        (not (opened sink1))
        (not (opened fridge1))
        (not (opened cabinet_upper1))
        (not (holdsAny agent1))
        (not (isCool bowl1))
        (not (atLocation agent1 sink1))
        (not (atLocation agent1 fridge1))
        (not (atLocation agent1 cabinet_upper1))
        (not (atLocation agent1 bowl1))
        (not (atLocation agent1 knife1))
    )
    (:goal (and
        (inReceptacle bowl1 cabinet_upper1)
        (isCool bowl1)
    ))
)