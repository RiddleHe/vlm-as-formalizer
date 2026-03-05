(define (problem warm_apple)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        apple1 apple2 apple3 - object
        pan - receptacle
        salt_shaker1 salt_shaker2 - object
        tomato - object
        bread - object
        spoon - object
        table - object
        countertop - object
    )
    (:init
        (atLocation robot table)
        (openable microwave)
        (not (opened microwave))
        (not (isOn microwave))
        (not (isToggled microwave))
        (not (isHot apple1))
        (not (isHot apple2))
        (not (isHot apple3))
        (not (holdsAny robot))
        (not (holds robot apple1))
        (not (holds robot apple2))
        (not (holds robot apple3))
        (inReceptacle apple1 table)
        (inReceptacle apple2 table)
        (inReceptacle apple3 table)
        (inReceptacle tomato table)
        (inReceptacle bread table)
        (inReceptacle spoon table)
        (inReceptacle pan table)
        (inReceptacle salt_shaker1 table)
        (inReceptacle salt_shaker2 countertop)
        (atLocation microwave countertop)
    )
    (:goal (and
        (isHot apple1)
        (inReceptacle apple1 microwave)
    ))
)