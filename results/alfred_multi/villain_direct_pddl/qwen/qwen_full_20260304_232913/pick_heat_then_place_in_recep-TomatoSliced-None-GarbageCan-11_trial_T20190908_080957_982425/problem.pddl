(define (problem put_slice_tomato_trash)
    (:domain put_task)
    (:objects
        agent1 - agent
        tomato - object
        knife - knife
        trash_can - receptacle
        sink - sink
        microwave - microwave
        fridge - fridge
    )
    (:init
        (atLocation agent1 sink)  ; Assuming the agent starts at the sink based on common kitchen layouts
        (openable trash_can)
        (not (opened trash_can))
        (not (holdsAny agent1))
        (not (isSliced tomato))
        (not (isClean tomato))
        (not (isHot tomato))
        (not (isCool tomato))
        (not (isOn knife))
        (not (isToggled knife))
        (not (inReceptacle tomato trash_can))
        (not (holds agent1 tomato))
        (not (holds agent1 knife))
    )
    (:goal
        (and
            (inReceptacle tomato trash_can)
            (isSliced tomato)
        )
    )
)