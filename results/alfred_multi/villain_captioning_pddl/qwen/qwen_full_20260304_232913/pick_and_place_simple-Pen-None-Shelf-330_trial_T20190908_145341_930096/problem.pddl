(define (problem move_pen_to_dresser)
    (:domain put_task)
    (:objects
        agent1 - agent
        dresser - receptacle
        penHolder - receptacle
        pen - object
    )
    (:init
        (atLocation agent1 penHolder)
        (inReceptacle pen penHolder)
        (not (holdsAny agent1))
    )
    (:goal (and (inReceptacle pen dresser)))
)