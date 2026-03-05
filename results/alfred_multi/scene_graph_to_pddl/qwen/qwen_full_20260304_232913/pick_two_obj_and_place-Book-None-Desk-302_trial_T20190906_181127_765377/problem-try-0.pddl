(define (problem put_books_on_desk)
    (:domain put_task)
    (:objects
        agent
        bed - receptacle
        desk - receptacle
        book1 - object
        book2 - object
        laptop - object
        panda_toy - object
        chair - object
        tablet1 - object
        tablet2 - object
    )
    (:init
        (openable bed)
        (openable desk)
        (inReceptacle book1 bed)
        (inReceptacle book2 bed)
        (inReceptacle laptop bed)
        (inReceptacle panda_toy bed)
        (inReceptacle tablet1 desk)
        (inReceptacle tablet2 desk)
        (not (atLocation agent bed))
        (not (atLocation agent desk))
        (not (holdsAny agent))
    )
    (:goal (and
        (inReceptacle book1 desk)
        (inReceptacle book2 desk)
    ))
)