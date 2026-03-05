(define (problem place_box_with_plate)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        table1 - receptacle
        countertop1 - receptacle
        box1 - object
        plate1 - object
    )
    (:init
        (openable microwave1)
        (not (opened microwave1))
        (inReceptacle box1 countertop1)
        (inReceptacle plate1 table1)
        (not (holdsAny agent1))
        (not (isClean plate1))
        (not (isHot plate1))
        (not (isCool plate1))
        (not (isSliced plate1))
        (not (isOn microwave1))
        (not (isToggled microwave1))
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 table1))
        (not (atLocation agent1 countertop1))
        (not (atLocation agent1 box1))
        (not (atLocation agent1 plate1))
    )
    (:goal (and
        (inReceptacle box1 table1)
        (inReceptacle plate1 box1)
    ))
)