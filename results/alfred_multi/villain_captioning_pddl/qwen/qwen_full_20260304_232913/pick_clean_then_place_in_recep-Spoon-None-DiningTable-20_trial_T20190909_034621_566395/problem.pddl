(define (problem clean_spoon)
    (:domain put_task)
    (:objects
        robot - agent
        sink - sink
        knife1 - knife
        knife2 - knife
        fork1 - object
        fork2 - object
        spoon - object
        mug - object
        egg1 - object
        egg2 - object
        book - object
        bottle - object
        toaster - object
        coffee_maker - object
        tomato1 - object
        tomato2 - object
        tomato3 - object
        lettuce - object
        potato1 - object
        potato2 - object
        pan - object
        bowl - object
    )
    (:init
        (openable sink)
        (not (opened sink))  ; assuming sink is not opened initially, though it's not specified
        (inReceptacle mug sink)
        (inReceptacle egg1 sink)
        (inReceptacle egg2 sink)
        (inReceptacle book sink)
        ; The spoon is not in any receptacle and not held
        (not (holdsAny robot))
        (not (atLocation robot sink))
        (not (atLocation robot knife1))
        (not (atLocation robot knife2))
        (not (atLocation robot fork1))
        (not (atLocation robot fork2))
        (not (atLocation robot spoon))
        (not (isClean spoon))
        (not (isHot spoon))
        (not (isCool spoon))
        (not (isSliced spoon))
        (not (isOn spoon))
        (not (isToggled spoon))
        ; Assume the sink is not opened initially
        (not (opened sink))
        ; The agent is not at any location initially
        ; We don't know the locations of the other objects, but for simplicity, we can assume they are at their respective counters.
        ; But the domain requires atLocation for interaction.
        ; We will not specify atLocation for objects except for those in receptacles, because the agent must go to them.
        ; For objects not in receptacles, we can assume they are at some location, but we don't have a location object.
        ; The domain has atLocation for agent and object, so we need to define where the objects are.
        ; Since the domain doesn't have a "table" or "counter" as objects, we can use the objects themselves as locations? But that's not standard.
        ; Alternatively, we can assume that the agent can go to any object by its name.
        ; In the domain, the action GotoLocation has parameters (?a - agent ?lEnd - object), so the object can be the location.
        ; So we can say atLocation robot ?o means the robot is at object ?o.
        ; So for objects not in receptacles, we can have them at their own location.
        ; But initially, the agent is not at any object.
        ; We will not specify atLocation for objects except for those in receptacles, because the agent must go to them.
        ; For the spoon, since it's not in a receptacle, we can assume it is at a location, but we don't know which.
        ; To simplify, I will not include atLocation for objects not in receptacles in the initial state, and the agent will need to find them.
        ; But the domain requires atLocation for the agent to interact.
        ; This is a limitation.
        ; I will assume that the spoon is on the countertop, and we can use the sink as a proxy for the countertop, but it's not accurate.
        ; Given the complexity, I will generate the PDDL with the initial state as above, and for the goal, we will use the sink.
    )
    (:goal (and
        (isClean spoon)
        (inReceptacle spoon sink)  ; standing on the table is approximated by in the sink
    ))
)