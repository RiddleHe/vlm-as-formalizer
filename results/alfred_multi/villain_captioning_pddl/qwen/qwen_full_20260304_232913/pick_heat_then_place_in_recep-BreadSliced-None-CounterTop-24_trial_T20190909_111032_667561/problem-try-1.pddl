(define (problem put_warm_slice_of_bread)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        sink - sink
        fridge - fridge
        knife - knife
        bread - object
        counter - object
    )
    (:init
        (openable microwave)
        (not (opened microwave))
        (not (isOn microwave))
        (not (isToggled microwave))
        (not (isHot bread))
        (not (isSliced bread))
        (atLocation robot counter)
        (inReceptacle bread microwave)
        (inReceptacle knife counter)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle bread counter)
        (isHot bread)
        (isSliced bread)
        (atLocation robot counter)
    ))
)