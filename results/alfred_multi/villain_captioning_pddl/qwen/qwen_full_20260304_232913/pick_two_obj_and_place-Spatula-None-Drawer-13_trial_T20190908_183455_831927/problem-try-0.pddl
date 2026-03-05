(define (problem place_spatulas_in_drawer)
    (:domain put_task)
    (:objects
        robot - agent
        spatula1 spatula2 - object
        counter_drawer - receptacle
        bread1 bread2 pot photo1 photo2 - object
    )
    (:init
        (not (atLocation robot counter_drawer))
        (not (atLocation robot spatula1))
        (not (atLocation robot spatula2))
        (not (holdsAny robot))
        (not (opened counter_drawer))
        (not (inReceptacle spatula1 counter_drawer))
        (not (inReceptacle spatula2 counter_drawer))
        (openable counter_drawer)
        (atLocation robot counter_drawer) ; Initial location assumption for planning start
        ; Spatulas are on counter, not held or in receptacle
        (atLocation robot spatula1)
        (atLocation robot spatula2)
        ; Other objects are present but not relevant to goal
        (atLocation robot bread1)
        (atLocation robot bread2)
        (atLocation robot pot)
        (atLocation robot photo1)
        (atLocation robot photo2)
    )
    (:goal (and
        (inReceptacle spatula1 counter_drawer)
        (inReceptacle spatula2 counter_drawer)
    ))
)