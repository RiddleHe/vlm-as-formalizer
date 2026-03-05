(define (problem put_box_with_plate_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        openable_box - receptacle
        dining_table - receptacle
        plate - object
        golden_statue - object
        newspaper - object
        keys - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (openable openable_box)
        (opened openable_box)
        (inReceptacle plate dining_table)
        (inReceptacle golden_statue dining_table)
        (inReceptacle newspaper dining_table)
        (inReceptacle keys dining_table)
        (inReceptacle openable_box dining_table)
        (atLocation robot dining_table)
    )
    (:goal (and
        (inReceptacle plate openable_box)
        (inReceptacle openable_box dining_table)
    ))
)