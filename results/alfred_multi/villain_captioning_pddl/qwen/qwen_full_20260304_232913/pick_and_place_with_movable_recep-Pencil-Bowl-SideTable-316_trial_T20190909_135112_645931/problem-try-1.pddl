(define (problem place_bowl_with_pencil_on_nightstand)
    (:domain put_task)
    (:objects
        robot - agent
        pencil - object
        bowl - object
        nightstand - object
    )
    (:init
        (not (atLocation robot pencil))
        (not (atLocation robot bowl))
        (not (atLocation robot nightstand))
        (not (holdsAny robot))
    )
    (:goal (and
        (atLocation robot nightstand)
        (inReceptacle bowl nightstand)  ; This will fail because nightstand is not a receptacle
        (inReceptacle pencil bowl)     ; This will fail because bowl is not a receptacle
    ))
)