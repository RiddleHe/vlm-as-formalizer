(define (problem put_frying_pan_with_fork_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        knife1 - knife
        fork1 - object
        cucumber1 - object
        cucumber2 - object
        potato1 - object
        egg1 - object
        paper_towel_roll1 - object
        bottle1 - object
        bread1 - object
        spatula1 - object
        round_table - object
        kitchen_counter - object
        ; Note: No frying pan is present, so it is not included in objects
    )
    (:init
        ; Agent is not at any location initially
        (not (atLocation agent1 round_table))
        (not (atLocation agent1 kitchen_counter))
        ; Objects are on surfaces (not in receptacles, as no receptacles are defined or present)
        (atLocation agent1 round_table) ; Assuming agent can be at table to interact with objects on it
        ; All objects are on the round table or kitchen counter
        (atLocation knife1 round_table)
        (atLocation fork1 round_table)
        (atLocation cucumber1 round_table)
        (atLocation cucumber2 round_table)
        (atLocation potato1 round_table)
        (atLocation egg1 round_table)
        (atLocation paper_towel_roll1 round_table)
        (atLocation bottle1 round_table)
        (atLocation bread1 kitchen_counter)
        (atLocation spatula1 kitchen_counter)
        ; No object is held by agent
        (not (holdsAny agent1))
        ; No receptacle is opened (no openable receptacles present)
        ; No object is clean, hot, cool, sliced, or toggled
        (not (isClean knife1))
        (not (isClean fork1))
        (not (isHot knife1))
        (not (isHot fork1))
        (not (isCool knife1))
        (not (isCool fork1))
        (not (isSliced knife1))
        (not (isSliced fork1))
        (not (isOn knife1))
        (not (isOn fork1))
        (not (isToggled knife1))
        (not (isToggled fork1))
    )
    (:goal 
        ; Goal: Put a frying pan with a fork in it on a round table.
        ; Since frying pan is not present, this goal is unachievable.
        ; We define it as placing fork1 in a non-existent frying pan on round_table.
        ; This will result in an unsolvable problem.
        (and
            ; We cannot represent "frying pan" as it is not an object in the scene.
            ; Therefore, the goal cannot be satisfied.
            ; In PDDL, we must specify a goal, so we leave it as an impossible condition.
            ; This is a placeholder to indicate the intended goal, even though it cannot be met.
            (inReceptacle fork1 frying_pan) ; frying_pan is not defined, so this will fail
            (atLocation frying_pan round_table)
        )
    )
)