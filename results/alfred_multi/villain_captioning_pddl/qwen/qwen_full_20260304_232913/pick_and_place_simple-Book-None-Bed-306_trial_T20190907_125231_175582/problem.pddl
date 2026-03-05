(define (problem move_book_to_bed)
    (:domain put_task)
    (:objects
        robot - agent
        book - object
        desk - receptacle
        bed - receptacle
        laptop - object
        pen - object
        lamp - object
        chair - object
        dog - object
        trash_can - receptacle
        pillow1 - object
        pillow2 - object
        radiator - object
    )
    (:init
        (atLocation robot desk) ; robot starts near the desk
        (inReceptacle book desk)
        (inReceptacle laptop desk)
        (inReceptacle pen desk)
        (inReceptacle lamp desk)
        (inReceptacle dog bed)
        (inReceptacle pillow1 bed)
        (inReceptacle pillow2 bed)
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle book bed)
            (not (inReceptacle book desk))
        )
    )
)