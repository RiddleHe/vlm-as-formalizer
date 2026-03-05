(define (problem microwave_mug_to_shelves)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        mug - object
        shelves - receptacle
        apple - object
        egg - object
        spoon - object
        bread - object
        pan - object
        stovetop - object
        counter - object
    )
    (:init
        (openable microwave)
        (not (opened microwave))
        (inReceptacle mug microwave)
        (atLocation robot microwave) ; Assuming robot starts near microwave for task initiation
        (not (holdsAny robot))
        (not (isHot mug))
        (not (isClean mug))
        (not (isCool mug))
        (not (isSliced mug))
        (not (isOn microwave))
        (not (isToggled microwave))
        (inReceptacle apple shelves)
        (inReceptacle egg shelves)
        (inReceptacle spoon shelves)
        ; The shelves are a receptacle and can hold the mug
        ; The pan is on the stovetop, but not relevant to the goal
    )
    (:goal (and
        (inReceptacle mug shelves)
        (isHot mug)
    ))
)