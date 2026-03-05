(define (problem find_tomato_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        table - receptacle
        fridge - receptacle
        microwave - receptacle
        tomato - object
        black_cylinder - object
        grey_rectangle - object
        spatula - object
        bread_loaf - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (not (opened fridge))
        (not (opened microwave))
        (not (isOn microwave))
        (not (holdsAny agent1))
        (inReceptacle tomato table)
        (inReceptacle black_cylinder table)
        (inReceptacle grey_rectangle table)
        (inReceptacle spatula table)
        (inReceptacle bread_loaf table)
        (not (isClean tomato))
        (not (isHot tomato))
        (not (isCool tomato))
        (not (isSliced tomato))
    )
    (:goal (and (inReceptacle tomato table)))
)