(define (problem put_racket_on_dresser)
    (:domain put_task)
    (:objects
        robot - agent
        dresser - receptacle
        tennis_racket - object
        laptop - object
        lamp - object
        bed - object
    )
    (:init
        (atLocation robot tennis_racket)
        (not (holdsAny robot))
        (not (inReceptacle tennis_racket dresser))
        (not (atLocation robot dresser))
        (openable dresser)
        (not (opened dresser))
        ; The laptop and lamp are on the dresser, but since dresser is not a receptacle in domain, we cannot model them as inReceptacle.
        ; For simplicity, we ignore them as they are not relevant to the goal.
    )
    (:goal (and
        (inReceptacle tennis_racket dresser)
    ))
)