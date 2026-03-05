(define (problem put_box_with_plate_on_table)
    (:domain put_task)
    (:objects
        agent
        microwave fridge sink - receptacle
        knife - object
        open_box table countertop - receptacle
        plate golden_statue newspaper keys - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (opened microwave)
        (opened fridge)
        (opened sink)
        (atLocation agent countertop)
        (inReceptacle plate table)
        (inReceptacle golden_statue table)
        (inReceptacle newspaper table)
        (inReceptacle keys table)
    )
    (:goal (and
        (inReceptacle plate open_box)
        (inReceptacle open_box table)
    ))
)