(define (problem get_pencil_and_look_under_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        nightstand - receptacle
        pencil - object
        lamp - object
        box - receptacle
        credit_card - object
        keys - object
        alarm_clock - object
    )
    (:init
        (atLocation robot nightstand)
        (inReceptacle pencil nightstand)
        (inReceptacle box nightstand)
        (inReceptacle credit_card nightstand)
        (inReceptacle keys nightstand)
        (inReceptacle alarm_clock nightstand)
        (openable box)
        (opened box)
        (isOn lamp)
    )
    (:goal (and
        (holds robot pencil)
        (atLocation robot lamp)
    ))
)