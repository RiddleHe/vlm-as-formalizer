(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        tomato - object
        egg - object
        glass - object
        spoon - object
        cabbage - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (inReceptacle tomato sink)
        (inReceptacle egg sink)
        (inReceptacle glass sink)
        (inReceptacle spoon sink)
        (inReceptacle cabbage sink)
        (not (isSliced tomato))
        (not (isHot tomato))
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle tomato sink)
        (isSliced tomato)
        (isHot tomato)
    ))
)