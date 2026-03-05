(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        tomato - object
        egg - object
        cabbage - object
        glass - object
        spoon - object
        potato - object
        fork - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle egg sink)
        (inReceptacle tomato sink)
        (inReceptacle cabbage sink)
        (inReceptacle glass sink)
        (inReceptacle spoon sink)
        (atLocation agent microwave)
    )
    (:goal
        (and
            (inReceptacle tomato sink)
            (isHot tomato)
            (isSliced tomato)
        )
    )
)