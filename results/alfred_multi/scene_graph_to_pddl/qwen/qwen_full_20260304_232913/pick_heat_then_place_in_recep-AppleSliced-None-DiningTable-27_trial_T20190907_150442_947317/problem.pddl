(define (problem warm_apple)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        pan - sink
        spoon - knife
        loaf - object
        tomato - object
        apple1 - object
        apple2 - object
        apple3 - object
        shaker1 - object
        shaker2 - object
    )
    (:init
        (openable microwave)
        (openable pan)
        (isOn microwave)
        (atLocation robot pan)
        (inReceptacle spoon pan)
        (inReceptacle loaf pan)
        (inReceptacle tomato pan)
        (inReceptacle apple1 pan)
        (inReceptacle apple2 pan)
        (inReceptacle apple3 pan)
        (inReceptacle shaker1 pan)
        (inReceptacle shaker2 pan)
    )
    (:goal (and (isHot apple1)))
)