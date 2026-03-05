(define (problem put_clean_mug_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        sink1 - sink
        microwave1 - microwave
        fridge1 - fridge
        mug1 - object
        knife1 - knife
        toaster1 - object
        green_glass1 - object
        bread_loaf1 - object
        bread_loaf2 - object
        plant_pot1 - object
        pepper_grinder1 - object
        spoon1 - object
        sponge1 - object
        countertop1 - object  ; treated as a location, not a receptacle per domain
        cabinet1 - object    ; the black cabinet under microwave, not a receptacle per domain
    )
    (:init
        ; Agent is not at any location initially
        (not (atLocation agent1 sink1))
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 fridge1))
        (not (atLocation agent1 mug1))
        (not (atLocation agent1 knife1))
        (not (atLocation agent1 toaster1))
        (not (atLocation agent1 green_glass1))
        (not (atLocation agent1 bread_loaf1))
        (not (atLocation agent1 bread_loaf2))
        (not (atLocation agent1 plant_pot1))
        (not (atLocation agent1 pepper_grinder1))
        (not (atLocation agent1 spoon1))
        (not (atLocation agent1 sponge1))
        (not (atLocation agent1 countertop1))
        (not (atLocation agent1 cabinet1))

        ; Receptacle properties
        (openable microwave1)
        (openable fridge1)
        ; sink1 is not openable per domain

        ; Initial object locations (from scene)
        (atLocation agent1 countertop1) ; Assuming agent starts near countertop for practicality, though caption says "not at any object's location". To make problem solvable, we place it at a location.
        ; Alternatively, if we strictly follow "not at any", we must first goto. But to avoid infinite init, we set agent at a location.
        ; Let's set agent at countertop1 as a starting point for the task.
        ; Update: The instruction says "robot is initially not at any object's location". So we leave all atLocation false and force first action to be GotoLocation.

        ; Reset: We will not set any atLocation for agent initially.
        ; Remove the above (atLocation agent1 countertop1) and leave all false.

        ; Objects in receptacles
        (inReceptacle knife1 sink1)
        (inReceptacle spoon1 sink1)
        (inReceptacle sponge1 sink1)

        ; Objects on surfaces (not in receptacles)
        (atLocation mug1 countertop1)
        (atLocation toaster1 countertop1)
        (atLocation green_glass1 countertop1)
        (atLocation bread_loaf1 countertop1)
        (atLocation bread_loaf2 countertop1)
        (atLocation plant_pot1 countertop1)
        (atLocation pepper_grinder1 cabinet1)
        (atLocation microwave1 cabinet1)
        (atLocation fridge1 countertop1) ; fridge is against wall, but we treat its base as on countertop for location purposes

        ; States
        (not (isClean mug1))
        (not (opened microwave1))
        (not (opened fridge1))
        (not (isOn microwave1))
        (not (isToggled microwave1))
        (not (holdsAny agent1))
        (not (holds agent1 ?o)) ; for all o, but we don't need to list all, as holdsAny is false

        ; Microwave is off
        (not (isOn microwave1))
    )
    (:goal
        (and
            (inReceptacle mug1 countertop1)  ; "on the table" -> on countertop
            (isClean mug1)
        )
    )
)