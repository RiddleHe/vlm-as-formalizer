(define (problem put_plate_knife_apple_in_fridge)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        bowl - object
        plate - object
        cup - object
        bread - object
        lettuce - object
        apple - object
        pan - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (opened microwave)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle cup microwave)
        (inReceptacle cup microwave)
        (inReceptacle apple microwave)
        (inReceptacle pan stove)
        (atLocation agent microwave)
    )
    (:goal (and
        (inReceptacle plate fridge)
        (inReceptacle knife fridge)
        (inReceptacle apple fridge)
    ))
)