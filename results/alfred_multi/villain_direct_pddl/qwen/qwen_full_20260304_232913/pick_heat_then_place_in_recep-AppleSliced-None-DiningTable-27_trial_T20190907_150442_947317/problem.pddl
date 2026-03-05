(define (problem warm_apple)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        apple1 apple2 apple3 - object
        pan1 - receptacle
        salt_shaker1 salt_shaker2 - object
        tomato1 - object
        bread1 - object
        spoon1 - object
        table1 - object
    )
    (:init
        (atLocation agent1 table1)
        (inReceptacle apple1 table1)
        (inReceptacle apple2 table1)
        (inReceptacle apple3 table1)
        (inReceptacle tomato1 table1)
        (inReceptacle bread1 table1)
        (inReceptacle spoon1 table1)
        (inReceptacle salt_shaker1 table1)
        (inReceptacle salt_shaker2 table1)
        (inReceptacle pan1 table1)
        (openable microwave1)
        (not (opened microwave1))
        (not (isHot apple1))
        (not (isHot apple2))
        (not (isHot apple3))
    )
    (:goal (and (isHot apple1)))
)