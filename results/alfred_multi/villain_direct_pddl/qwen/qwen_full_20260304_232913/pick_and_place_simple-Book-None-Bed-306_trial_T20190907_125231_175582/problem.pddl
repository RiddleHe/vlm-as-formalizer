(define (problem move_book_to_bed)
    (:domain put_task)
    (:objects
        robot - agent
        book - object
        laptop - object
        desk - receptacle
        bed - receptacle
        chair - object
        trash_can - receptacle
        lamp - object
        pen - object
        cd - object
    )
    (:init
        (atLocation robot desk)
        (inReceptacle book desk)
        (inReceptacle laptop desk)
        (inReceptacle pen desk)
        (inReceptacle cd desk)
        (inReceptacle lamp desk)
        (inReceptacle chair desk)
        (inReceptacle trash_can bed)
    )
    (:goal
        (and
            (inReceptacle book bed)
        )
    )
)