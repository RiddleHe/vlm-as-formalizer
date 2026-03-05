(define (problem cool_egg_and_put_in_microwave)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        egg - object
        knife - knife
    )
    (:init
        (not (atLocation robot microwave))
        (not (atLocation robot fridge))
        (not (atLocation robot egg))
        (not (atLocation robot knife))
        (not (opened microwave))
        (not (opened fridge))
        (not (holdsAny robot))
        (not (isCool egg))
        (not (isHot egg))
        (not (isSliced egg))
        (not (isClean egg))
        (not (isOn microwave))
        (not (isToggled microwave))
        (openable microwave)
        (openable fridge)
        (atLocation robot egg) ; Assuming the robot can start at the egg's location for simplicity, or it will need to GotoLocation first
    )
    (:goal (and
        (inReceptacle egg microwave)
        (isCool egg)
    ))
)