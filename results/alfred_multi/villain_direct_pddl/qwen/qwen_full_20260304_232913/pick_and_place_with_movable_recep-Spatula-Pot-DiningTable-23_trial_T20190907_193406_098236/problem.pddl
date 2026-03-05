(define (problem put_pot_with_spatula_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        pot1 pot2 - object
        spatula1 - object
        table1 - receptacle
        stove1 - receptacle
    )
    (:init
        (atLocation agent1 stove1)
        (inReceptacle pot1 stove1)
        (inReceptacle pot2 stove1)
        (inReceptacle spatula1 table1)
        (not (holdsAny agent1))
    )
    (:goal
        (and
            (inReceptacle spatula1 pot1)
            (inReceptacle pot1 table1)
        )
    )
)