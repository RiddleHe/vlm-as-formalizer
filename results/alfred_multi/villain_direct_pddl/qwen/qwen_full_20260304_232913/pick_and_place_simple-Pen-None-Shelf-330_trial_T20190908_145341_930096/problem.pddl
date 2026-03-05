(define (problem put_pen_on_dresser)
    (:domain put_task)
    (:objects
        robot - agent
        pen - object
        dresser - receptacle
        hexagonal_bin - receptacle
    )
    (:init
        (atLocation robot hexagonal_bin)
        (inReceptacle pen hexagonal_bin)
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle pen dresser)
        )
    )
)