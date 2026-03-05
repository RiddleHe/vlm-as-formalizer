(define (problem put_warm_apple_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        fridge1 - fridge
        sink1 - sink
        knife1 - knife
        black_table1 - receptacle
        white_table1 - receptacle
        pan1 - receptacle
        pot1 - receptacle
        apple1 - object
        apple2 - object
        salt_shaker1 - object
        spoon1 - object
        bottle1 - object
        plate1 - object
    )
    (:init
        (openable microwave1)
        (openable fridge1)
        (openable sink1)
        (opened microwave1)
        (isOn microwave1)
        (isToggled microwave1)
        (inReceptacle apple1 black_table1)
        (inReceptacle spoon1 black_table1)
        (inReceptacle bottle1 black_table1)
        (inReceptacle plate1 black_table1)
        (inReceptacle salt_shaker1 white_table1)
        (inReceptacle apple2 white_table1)
        (inReceptacle pan1 white_table1)
    )
    (:goal (and
        (inReceptacle apple1 white_table1)
        (isHot apple1)
    ))
)