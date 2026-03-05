(define (problem inspect_book_with_light)
    (:domain put_task)
    (:objects
        robot - agent
        bed - receptacle
        nightstand - receptacle
        lamp - object
        book - object
        laptop - object
        pillow1 - object
        pillow2 - object
        pen - object
        vase - object
    )
    (:init
        (atLocation robot nightstand)
        (inReceptacle book bed)
        (inReceptacle laptop bed)
        (inReceptacle pillow1 bed)
        (inReceptacle pillow2 bed)
        (inReceptacle pen nightstand)
        (inReceptacle vase nightstand)
        (inReceptacle lamp nightstand)
        (isOn lamp)
        (openable nightstand)
        (opened nightstand)
    )
    (:goal (and
        (atLocation robot book)
        (isToggled lamp)
    ))
)