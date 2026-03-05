(define (problem put_grey_plate_with_spoon_on_counter)
    (:domain put_task)
    (:objects
        agent
        microwave fridge sink - receptacle
        knife grey_plate large_metal_spoon green_book - object
        marble_counter wooden_cabinet - receptacle
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (opened microwave)
        (opened fridge)
        (opened sink)
        (inReceptacle grey_plate sink)
        (inReceptacle large_metal_spoon sink)
        (inReceptacle knife sink)
        (inReceptacle green_book sink)
        (atLocation agent sink)
    )
    (:goal (and
        (inReceptacle grey_plate marble_counter)
        (inReceptacle large_metal_spoon grey_plate)
    ))
)