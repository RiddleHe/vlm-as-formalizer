(define (problem put_box_on_chair)
    (:domain put_task)
    (:objects
        agent1 - agent
        cardboard_box - object
        green_chair - receptacle
        wooden_table - object
        blue_card - object
        books - object
        pencil - object
    )
    (:init
        (atLocation agent1 wooden_table)
        (not (atLocation agent1 green_chair))
        (not (holdsAny agent1))
        (not (holds agent1 cardboard_box))
        (not (opened green_chair))
        (not (openable green_chair))  ; assuming it's not openable, as it's a chair
        ; Note: Since green_chair is not defined as openable in the domain, we cannot open it.
        ; But for the sake of the task, we will assume it can be used as a receptacle without opening.
        ; This is a domain extension.
        ; Alternatively, we can omit openable and opened predicates for the chair.
        ; Since the domain requires openable for OpenObject and PutObjectInReceptacle, and the chair is not openable, we cannot use those actions.
        ; Therefore, this approach is invalid.
    )
    (:goal (and
        (atLocation agent1 green_chair)
        (inReceptacle cardboard_box green_chair)
    ))
)