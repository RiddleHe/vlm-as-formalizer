(define (problem put_bowl_with_pencil_on_nightstand)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        pencil - knife
        bowl - object
        nightstand - receptacle
        desk - receptacle
        chair - object
        monitor - object
        book - object
        alarm_clock - object
        cup - object
        laptop - object
        cd - object
        bed - object
    )
    (:init
        (openable microwave)
        (not (opened microwave))
        (not (holdsAny robot))
        (not (atLocation robot microwave))
        (not (atLocation robot desk))
        (not (atLocation robot nightstand))
        (not (atLocation robot chair))
        (not (atLocation robot monitor))
        (not (atLocation robot book))
        (not (atLocation robot alarm_clock))
        (not (atLocation robot cup))
        (not (atLocation robot laptop))
        (not (atLocation robot cd))
        (not (atLocation robot bed))
        (inReceptacle book desk)
        (inReceptacle pencil desk)
        (inReceptacle alarm_clock desk)
        (inReceptacle cup desk)
        (inReceptacle bowl desk)
        (inReceptacle cd desk)
        (inReceptacle laptop desk)
        (inReceptacle monitor desk)
        (isOn monitor)
        (isOn laptop)
    )
    (:goal
        (and
            (inReceptacle bowl nightstand)
            (inReceptacle pencil bowl)
        )
    )
)