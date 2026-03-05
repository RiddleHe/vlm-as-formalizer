(define (problem bathroom_task)
    (:domain put_task)
    (:objects
        agent1 - agent
        vanity_cabinet - receptacle
        sink - receptacle
        countertop - object
        toilet - object
        floor - object
        wall - object
        small_yellow_object - object
    )
    (:init
        (openable vanity_cabinet)
        (not (opened vanity_cabinet))
        (atLocation agent1 floor) ; Agent starts on the floor
        (inReceptacle small_yellow_object countertop) ; Small yellow object is on the countertop
        (inReceptacle sink countertop) ; Sink is in the countertop
        (inReceptacle countertop vanity_cabinet) ; Countertop is on the vanity cabinet
        (not (holdsAny agent1)) ; Agent is not holding anything
    )
    (:goal (and
        (inReceptacle small_yellow_object sink) ; Goal: place the small yellow object in the sink
    ))
)