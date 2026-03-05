(define (problem put_soap_on_rack)
    (:domain put_task)
    (:objects
        agent1 - agent
        soap1 - object
        soap2 - object
        steel_rack - receptacle
        sink - sink
    )
    (:init
        (atLocation agent1 sink)
        (inReceptacle soap1 sink)
        (inReceptacle soap2 sink)
        (not (holdsAny agent1))
    )
    (:goal
        (and
            (inReceptacle soap1 steel_rack)
            (inReceptacle soap2 steel_rack)
        )
    )
)