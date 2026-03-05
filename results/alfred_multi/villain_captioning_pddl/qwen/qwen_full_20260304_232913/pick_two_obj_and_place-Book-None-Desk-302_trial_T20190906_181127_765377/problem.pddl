(define (problem put_books_on_desk)
    (:domain put_task)
    (:objects
        robot - agent
        book1 book2 - object
        bed desk - receptacle
        laptop panda_plush - object
        tablet bowl - object
        chair - object
    )
    (:init
        (atLocation robot bed) ; Assuming robot starts near the bed for efficiency, as it's the source.
        (inReceptacle book1 bed)
        (inReceptacle book2 bed)
        (inReceptacle laptop bed)
        (inReceptacle panda_plush bed)
        (inReceptacle tablet desk)
        (inReceptacle bowl desk)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle book1 desk)
        (inReceptacle book2 desk)
    ))
)