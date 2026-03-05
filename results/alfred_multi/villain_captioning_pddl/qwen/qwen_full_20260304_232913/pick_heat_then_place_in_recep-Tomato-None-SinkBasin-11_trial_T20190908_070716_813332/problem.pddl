(define (problem put_heated_tomato_in_sink)
    (:domain put_task)
    (:objects
        agent1 - agent
        tomato1 tomato2 - object
        microwave1 - microwave
        sink1 - sink
        stovetop1 - object
        pot1 - object
        bread1 - object
        paper_towel_roll1 - object
        spatula1 - object
    )
    (:init
        ; Locations and spatial relationships
        (atLocation agent1 stovetop1) ; agent starts near stovetop
        (inReceptacle tomato2 sink1) ; one tomato is already in the sink
        ; Receptacle properties
        (openable microwave1)
        (openable sink1)
        ; States
        (not (opened microwave1))
        (not (opened sink1))
        (not (isHot tomato1))
        (not (isHot tomato2))
        (not (isClean tomato1))
        (not (isClean tomato2))
        (isOn stovetop1)
        ; Agent state
        (not (holdsAny agent1))
    )
    (:goal (and
        (inReceptacle tomato1 sink1)
        (isHot tomato1)
    ))
)