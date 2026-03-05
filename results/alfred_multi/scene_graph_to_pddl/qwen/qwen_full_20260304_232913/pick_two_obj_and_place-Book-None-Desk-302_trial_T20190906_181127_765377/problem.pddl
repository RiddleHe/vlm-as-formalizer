(define (problem put_books_on_desk)
    (:domain put_task)
    (:objects
        agent - agent
        bed - receptacle
        desk - receptacle
        laptop - object
        panda_stuffed_animal - object
        book1 - object
        book2 - object
        chair - object
        tablet1 - object
        tablet2 - object
    )
    (:init
        (openable bed)
        (openable desk)
        (inReceptacle laptop bed)
        (inReceptacle panda_stuffed_animal bed)
        (inReceptacle book1 bed)
        (inReceptacle book2 bed)
        (inReceptacle tablet1 desk)
        (inReceptacle tablet2 desk)
        (not (atLocation agent bed))
        (not (atLocation agent desk))
        (not (holdsAny agent))
    )
    (:goal
        (and
            (inReceptacle book1 desk)
            (inReceptacle book2 desk)
        )
    )
)