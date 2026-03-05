(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        knife - object
        pan - object
        potato - object
        trash_can - receptacle
        cup - receptacle
        tomato - object
        fork - object
        spoon - object
        bread - object
        cutting_board - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle tomato trash_can)
        (inReceptacle fork cup)
        (atLocation agent microwave) ; assuming agent starts near microwave for planning
    )
    (:goal
        (and
            (inReceptacle pan fridge)
            (inReceptacle knife pan)
            (inReceptacle potato pan)
            (isSliced potato)
            (isHot potato)
        )
    )
)