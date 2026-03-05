(define (problem put_plate_with_keys_on_small_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        fridge1 - fridge
        sink1 - sink
        knife1 - knife
        small_table1 - receptacle
        dining_table1 - receptacle
        plate1 - object
        keys1 - object
        remote1 - object
        laptop1 - object
        chair1 - object
        chair2 - object
        yellow_couch1 - object
        black_monitor1 - object
    )
    (:init
        (openable microwave1)
        (openable fridge1)
        (openable sink1)
        (inReceptacle plate1 dining_table1)
        (inReceptacle keys1 small_table1)
        (inReceptacle remote1 dining_table1)
        (inReceptacle laptop1 dining_table1)
        (not (holdsAny agent1))
    )
    (:goal (and
        (inReceptacle plate1 small_table1)
        (inReceptacle keys1 plate1)
    ))
)