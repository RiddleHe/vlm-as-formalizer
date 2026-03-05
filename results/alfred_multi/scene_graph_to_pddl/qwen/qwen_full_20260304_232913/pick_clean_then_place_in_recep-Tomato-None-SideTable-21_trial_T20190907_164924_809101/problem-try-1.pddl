(define (problem put_washed_tomato_on_table)
    (:domain put_task)
    (:objects
        agent
        black_fridge - fridge
        kitchen_sink - sink
        black_table - receptacle
        tomato_on_sink - object
        tomato_on_table - object
        lettuce_in_sink - object
        knife_on_sink - knife
    )
    (:init
        (openable black_fridge)
        (not (opened black_fridge))
        (inReceptacle lettuce_in_sink kitchen_sink)
        (atLocation agent black_table) ; Assuming agent starts near black_table as a plausible initial location
        (not (holdsAny agent))
        (not (isClean tomato_on_sink))
        (not (isSliced tomato_on_sink))
        (not (isHot tomato_on_sink))
        (not (isCool tomato_on_sink))
        (not (isOn tomato_on_sink))
        (not (isToggled tomato_on_sink))
        (atLocation agent black_table) ; Agent is initially at black_table
    )
    (:goal (and
        (inReceptacle tomato_on_sink black_table)
        (isClean tomato_on_sink)
    ))
)