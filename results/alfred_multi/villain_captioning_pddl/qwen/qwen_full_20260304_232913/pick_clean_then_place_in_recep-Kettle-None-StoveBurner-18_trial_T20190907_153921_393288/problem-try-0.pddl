(define (problem clean_teapot_on_stove)
    (:domain put_task)
    (:objects
        robot - agent
        stove - receptacle
        sink - receptacle
        tea_pot - object
        fork - object
        pot - object
    )
    (:init
        (not (atLocation robot stove))
        (not (atLocation robot sink))
        (not (atLocation robot tea_pot))
        (not (atLocation robot fork))
        (not (atLocation robot pot))
        (inReceptacle tea_pot stove)
        (not (isClean tea_pot))
        (not (holdsAny robot))
        (not (holds robot tea_pot))
        (not (opened stove))
        (not (opened sink))
        (not (isOn stove))
        (not (isHot tea_pot))
        (not (isCool tea_pot))
        (not (isSliced tea_pot))
        (not (isToggled stove))
    )
    (:goal (and
        (inReceptacle tea_pot stove)
        (isClean tea_pot)
    ))
)