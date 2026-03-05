(define (problem inspect_book_with_light)
    (:domain put_task)
    (:objects
        robot - agent
        bed - receptacle
        nightstand - receptacle
        book - object
        laptop - object
        lamp - object
        pillow1 - object
        pillow2 - object
        pencil - object
        jar - object
    )
    (:init
        (atLocation robot nightstand) ; Assuming robot starts near nightstand for efficiency
        (openable nightstand)
        (not (opened nightstand))
        (not (isOn lamp))
        (inReceptacle book bed)
        (inReceptacle laptop bed)
        (inReceptacle pillow1 bed)
        (inReceptacle pillow2 bed)
        (inReceptacle lamp nightstand)
        (inReceptacle pencil nightstand)
        (inReceptacle jar nightstand)
        (not (holdsAny robot))
    )
    (:goal (and
        (isOn lamp)
        (atLocation robot book)
    ))
)