(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        tomato - object
        lettuce - object
        egg - object
        glass - object
        spoon - object
        stool - object
        plant - object
        pot - object
        pan - object
        book - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (opened microwave)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle tomato sink)
        (inReceptacle lettuce sink)
        (inReceptacle egg sink)
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