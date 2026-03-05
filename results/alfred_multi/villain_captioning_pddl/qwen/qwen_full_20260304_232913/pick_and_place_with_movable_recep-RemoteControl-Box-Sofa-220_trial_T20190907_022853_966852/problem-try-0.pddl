(define (problem put_remote_in_box_on_couch)
    (:domain put_task)
    (:objects
        agent1 - agent
        cardboard_box - receptacle
        couch - receptacle
        remote1 - object
        remote2 - object
        small_green_box - object
        green_cup - object
        round_gold_cushion - object
        coffee_table - object
    )
    (:init
        ; Agent is not at any location initially
        (not (atLocation agent1 cardboard_box))
        (not (atLocation agent1 couch))
        (not (atLocation agent1 remote1))
        (not (atLocation agent1 remote2))
        (not (atLocation agent1 small_green_box))
        (not (atLocation agent1 green_cup))
        (not (atLocation agent1 round_gold_cushion))
        (not (atLocation agent1 coffee_table))

        ; Cardboard box is openable and opened
        (openable cardboard_box)
        (opened cardboard_box)

        ; Couch is not openable
        (not (openable couch))

        ; Objects are on the coffee table
        (atLocation cardboard_box coffee_table)
        (atLocation remote1 coffee_table)
        (atLocation remote2 coffee_table)
        (atLocation small_green_box coffee_table)
        (atLocation green_cup coffee_table)

        ; Couch has the cushion on it (not relevant to task, but present)
        (atLocation round_gold_cushion couch)

        ; No object is held by agent
        (not (holdsAny agent1))

        ; No object is in any receptacle initially (except cushion on couch, but it's not a receptacle object)
        (not (inReceptacle remote1 cardboard_box))
        (not (inReceptacle remote2 cardboard_box))
        (not (inReceptacle small_green_box cardboard_box))
        (not (inReceptacle green_cup cardboard_box))
        (not (inReceptacle cardboard_box couch))

        ; No cleaning, heating, cooling, slicing, or toggling states are relevant
        ; (isClean, isHot, isCool, isSliced, isOn, isToggled are not required for this task)
    )
    (:goal
        (and
            ; The cardboard box is on the couch
            (inReceptacle cardboard_box couch)
            ; One remote is inside the cardboard box
            (or
                (inReceptacle remote1 cardboard_box)
                (inReceptacle remote2 cardboard_box)
            )
        )
    )
)