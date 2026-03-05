(define (problem put_cold_lettuce_in_garbage)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        trash_can - receptacle
        tomato - object
        lettuce - object
        bread - object
        pot - object
        pan - object
        spoon - object
        spatula - object
        plate1 - object
        plate2 - object
        photo - object
        magnet - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (openable sink)
        (openable trash_can)
        (opened trash_can)
        (isOn microwave)
        (isOn sink)
        (isToggled microwave)
        (isToggled sink)
        (inReceptacle tomato trash_can)
        (atLocation robot trash_can)
    )
    (:goal (and
        (inReceptacle lettuce trash_can)
        (isCool lettuce)
    ))
)