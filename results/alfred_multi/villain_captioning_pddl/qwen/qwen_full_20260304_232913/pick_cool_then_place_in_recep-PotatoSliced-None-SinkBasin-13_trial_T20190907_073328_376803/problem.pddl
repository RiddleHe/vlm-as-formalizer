(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        fridge1 - fridge
        sink1 - sink
        potato1 - object
        knife1 - knife
        tomato1 - object
        fork1 - object
        bread1 - object
    )
    (:init
        (openable fridge1)
        (not (opened fridge1))
        (not (holdsAny agent1))
        (not (isSliced potato1))
        (not (isCool potato1))
        (not (isClean potato1))
        (not (isHot potato1))
        (not (isOn knife1))
        (not (isToggled knife1))
        (inReceptacle tomato1 sink1)
        (inReceptacle fork1 sink1)
        (atLocation agent1 potato1) ; Assuming agent starts near potato for simplicity, or this can be omitted if agent starts nowhere.
        ; Alternatively, if agent starts nowhere, omit the atLocation predicate and let GotoLocation be the first action.
        ; For this problem, we'll assume the agent must navigate, so we omit initial atLocation.
    )
    (:goal (and
        (inReceptacle potato1 sink1)
        (isSliced potato1)
        (isCool potato1)
        (inReceptacle knife1 fridge1)
    ))
)