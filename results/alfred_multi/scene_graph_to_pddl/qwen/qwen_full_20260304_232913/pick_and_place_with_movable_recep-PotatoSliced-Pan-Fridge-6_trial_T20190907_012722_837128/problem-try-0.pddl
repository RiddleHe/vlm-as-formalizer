(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        pan - object
        potato - object
        trash_can - receptacle
        cup - object
        fork - object
        spoon - object
        cutting_board - object
        bread - object
        lettuce - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle potato trash_can)
        (inReceptacle cup countertop)
        (inReceptacle fork countertop)
        (inReceptacle spoon countertop)
        (inReceptacle cutting_board countertop)
        (inReceptacle pan countertop)
        (inReceptacle bread countertop)
        (inReceptacle lettuce countertop)
        (atLocation agent countertop) ; assuming agent starts at countertop for initial interaction
    )
    (:goal
        (and
            (inReceptacle pan fridge)
            (inReceptacle knife pan)
            (isSliced potato)
            (isHot potato)
            (inReceptacle potato pan)
        )
    )
)