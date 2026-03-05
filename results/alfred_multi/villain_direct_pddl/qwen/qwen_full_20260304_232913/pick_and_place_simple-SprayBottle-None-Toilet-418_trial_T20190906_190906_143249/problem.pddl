(define (problem put_spray_bottle_on_toilet)
    (:domain put_task)
    (:objects
        agent1 - agent
        spray_bottle - object
        toilet - receptacle
        sink - sink
        mirror - object
        towel - object
        toilet_paper - object
        candle - object
        soap - object
        window - object
    )
    (:init
        (atLocation agent1 sink)
        (inReceptacle spray_bottle sink)
        (openable toilet)
        (not (opened toilet))
        (not (holdsAny agent1))
        (not (atLocation agent1 toilet))
    )
    (:goal
        (inReceptacle spray_bottle toilet)
    )
)