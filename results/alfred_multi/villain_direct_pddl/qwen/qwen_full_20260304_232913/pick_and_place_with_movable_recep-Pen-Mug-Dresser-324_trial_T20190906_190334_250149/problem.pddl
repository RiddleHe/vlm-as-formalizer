(define (problem put_pen_in_cup)
    (:domain put_task)
    (:objects
        robot - agent
        pen - object
        black_cup - receptacle
        dresser - receptacle
        laptop - object
    )
    (:init
        (atLocation robot dresser)
        (inReceptacle pen dresser)
        (inReceptacle black_cup dresser)
        (inReceptacle laptop dresser)
    )
    (:goal
        (inReceptacle pen black_cup)
    )
)