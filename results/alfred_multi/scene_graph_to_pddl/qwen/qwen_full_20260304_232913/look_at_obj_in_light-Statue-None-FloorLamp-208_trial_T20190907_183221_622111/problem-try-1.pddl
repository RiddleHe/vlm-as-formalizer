(define (problem examine_trophy_with_lamp)
    (:domain put_task)
    (:objects
        agent
        black_table - receptacle
        black_statue - object
        brown_lamp_base - object
        brown_lamp_pole - object
        brown_lamp_shade - object
    )
    (:init
        (inReceptacle black_statue black_table)
        (not (atLocation agent black_table))
        (not (atLocation agent black_statue))
        (not (atLocation agent brown_lamp_base))
        (not (atLocation agent brown_lamp_pole))
        (not (atLocation agent brown_lamp_shade))
        (not (holdsAny agent))
    )
    (:goal
        (and
            (atLocation agent black_statue)
            (atLocation agent brown_lamp_base)
        )
    )
)