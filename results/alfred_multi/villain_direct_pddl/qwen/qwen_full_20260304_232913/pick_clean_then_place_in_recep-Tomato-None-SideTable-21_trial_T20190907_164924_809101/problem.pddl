(define (problem put_washed_tomato_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        tomato - object
        knife - knife
        sink - sink
        table - receptacle
        fridge - fridge
    )
    (:init
        (atLocation agent1 sink)
        (inReceptacle tomato sink)
        (openable fridge)
        (not (opened fridge))
        (not (holdsAny agent1))
        (not (isClean tomato))
        (not (isSliced tomato))
        (not (isHot tomato))
        (not (isCool tomato))
        (not (isOn tomato))
        (not (isToggled tomato))
    )
    (:goal
        (and
            (inReceptacle tomato table)
            (isClean tomato)
        )
    )
)