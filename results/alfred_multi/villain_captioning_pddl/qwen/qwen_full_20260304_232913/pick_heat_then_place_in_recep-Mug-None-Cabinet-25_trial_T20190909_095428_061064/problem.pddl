(define (problem warm_mug_and_put_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        mug - object
        coffee_maker - microwave
        cabinet - receptacle
        sink - receptacle
        knife - knife
    )
    (:init
        (atLocation robot coffee_maker)
        (inReceptacle mug coffee_maker)
        (openable cabinet)
        (not (opened cabinet))
        (not (isHot mug))
        (not (isOn coffee_maker))
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle mug cabinet)
        (isHot mug)
    ))
)