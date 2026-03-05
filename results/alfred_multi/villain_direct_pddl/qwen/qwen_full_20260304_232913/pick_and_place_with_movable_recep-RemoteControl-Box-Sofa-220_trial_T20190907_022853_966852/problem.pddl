(define (problem put_box_with_remote_on_couch)
    (:domain put_task)
    (:objects
        robot - agent
        box - receptacle
        remote - object
        couch - receptacle
        table - object
        candle - object
        tissue_box - object
    )
    (:init
        (atLocation robot table)
        (inReceptacle box table)
        (inReceptacle remote table)
        (inReceptacle candle table)
        (inReceptacle tissue_box table)
        (openable box)
        (opened box)
    )
    (:goal
        (and
            (inReceptacle remote box)
            (inReceptacle box couch)
        )
    )
)