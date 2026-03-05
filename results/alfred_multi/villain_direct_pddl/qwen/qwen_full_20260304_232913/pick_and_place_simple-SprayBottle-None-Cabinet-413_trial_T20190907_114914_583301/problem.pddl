(define (problem put_spray_bottle_in_cabinet)
    (:domain put_task)
    (:objects
        agent1 - agent
        spray_bottle - object
        cabinet - receptacle
        toilet - object
        sink - sink
        trash_can - receptacle
        bathtub - receptacle
        mirror - object
        window - object
        towel - object
        vent - object
    )
    (:init
        (atLocation agent1 toilet)
        (holdsAny agent1)
        (holds agent1 spray_bottle)
        (openable cabinet)
        (not (opened cabinet))
        (not (inReceptacle spray_bottle cabinet))
    )
    (:goal (and (inReceptacle spray_bottle cabinet)))
)