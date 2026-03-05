(define (problem put_cup_on_desk)
    (:domain put_task)
    (:objects
        agent1 - agent
        cup - object
        desk - receptacle
        bookshelf - receptacle
    )
    (:init
        (atLocation agent1 bookshelf)
        (inReceptacle cup bookshelf)
        (openable bookshelf)
        (opened bookshelf)
    )
    (:goal
        (and
            (inReceptacle cup desk)
            (atLocation agent1 desk)
        )
    )
)