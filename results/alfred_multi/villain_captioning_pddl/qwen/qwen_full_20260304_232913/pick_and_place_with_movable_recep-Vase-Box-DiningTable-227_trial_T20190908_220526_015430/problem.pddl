(define (problem put_box_with_plate_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        box - object
        plate - object
        table - receptacle
        shelf - receptacle
    )
    (:init
        (atLocation robot shelf)
        (inReceptacle box shelf)
        (inReceptacle plate table)
    )
    (:goal (and
        (inReceptacle box table)
        (inReceptacle plate table)
    ))
)