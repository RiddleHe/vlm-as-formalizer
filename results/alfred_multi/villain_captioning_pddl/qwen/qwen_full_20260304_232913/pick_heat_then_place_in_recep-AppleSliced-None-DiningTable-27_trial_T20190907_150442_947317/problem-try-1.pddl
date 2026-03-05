(define (problem warm_apple)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        pan - receptacle
        apple1 apple2 apple3 - object
        tomato - object
        bread - object
        shaker1 shaker2 - object
        spoon - object
        table - object
    )
    (:init
        (atLocation robot table)
        (openable microwave)
        (not (opened microwave))
        (not (isOn microwave))
        (not (isHot apple1))
        (not (isHot apple2))
        (not (isHot apple3))
        (not (holdsAny robot))
        (not (holds robot apple1))
        (not (holds robot apple2))
        (not (holds robot apple3))
        (not (inReceptacle apple1 microwave))
        (not (inReceptacle apple2 microwave))
        (not (inReceptacle apple3 microwave))
        (not (inReceptacle apple1 pan))
        (not (inReceptacle apple2 pan))
        (not (inReceptacle apple3 pan))
        (atLocation apple1 table)
        (atLocation apple2 table)
        (atLocation apple3 table)
        (atLocation tomato table)
        (atLocation bread table)
        (atLocation shaker1 table)
        (atLocation shaker2 table)
        (atLocation spoon table)
        (atLocation microwave table) ; assuming microwave is accessible from table area for simplicity
    )
    (:goal (and
        (isHot apple1) ; or apple2 or apple3, any one apple heated
    ))
)