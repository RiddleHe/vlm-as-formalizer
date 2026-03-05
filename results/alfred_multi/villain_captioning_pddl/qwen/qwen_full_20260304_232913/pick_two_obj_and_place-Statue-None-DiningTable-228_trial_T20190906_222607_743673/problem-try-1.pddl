(define (problem set_statues_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        statue1 statue2 remote ring - object
        coffee_table sofa box - receptacle
    )
    (:init
        (atLocation robot coffee_table)
        (inReceptacle statue1 coffee_table)
        (inReceptacle statue2 coffee_table)
        (inReceptacle remote coffee_table)
        (inReceptacle ring coffee_table)
        (inReceptacle laptop sofa)
        (inReceptacle box sofa)
        (openable box)
        (opened box)
    )
    (:goal (and
        (inReceptacle statue1 coffee_table)
        (inReceptacle statue2 coffee_table)
    ))
)