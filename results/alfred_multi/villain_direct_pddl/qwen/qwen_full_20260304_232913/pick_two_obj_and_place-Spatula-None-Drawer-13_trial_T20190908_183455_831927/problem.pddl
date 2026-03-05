(define (problem put_spatulas_in_drawer)
    (:domain put_task)
    (:objects
        agent1 - agent
        spatula1 spatula2 - object
        counter_drawer - receptacle
    )
    (:init
        (atLocation agent1 spatula1)
        (atLocation agent1 spatula2)
        (openable counter_drawer)
        (not (opened counter_drawer))
    )
    (:goal (and
        (inReceptacle spatula1 counter_drawer)
        (inReceptacle spatula2 counter_drawer)
    ))
)