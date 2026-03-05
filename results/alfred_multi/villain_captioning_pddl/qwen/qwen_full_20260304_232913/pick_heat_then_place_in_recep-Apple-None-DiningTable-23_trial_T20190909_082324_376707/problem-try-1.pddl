(define (problem heat_apple_and_place)
    (:domain put_task)
    (:objects
        robot - agent
        apple - object
        sponge - object
        knife - knife
        microwave - microwave
        sink - sink
        table - object  ; Note: table is not a receptacle per domain, but we'll use it for location reference
    )
    (:init
        ; Initial locations: objects are on the table
        (atLocation robot table)
        (atLocation apple table)
        (atLocation sponge table)
        (atLocation knife table)
        (atLocation microwave microwave)  ; microwave is at its own location
        (atLocation sink sink)            ; sink is at its own location

        ; Microwave is openable but initially closed
        (openable microwave)
        (not (opened microwave))

        ; Sink is openable but initially closed
        (openable sink)
        (not (opened sink))

        ; Apple is not heated, not cooled, not sliced
        (not (isHot apple))
        (not (isCool apple))
        (not (isSliced apple))

        ; Robot is not holding anything
        (not (holdsAny robot))

        ; Apple is to the right of the sponge (spatial relationship for goal)
        ; This is a conceptual constraint; we'll handle placement via actions
    )
    (:goal
        (and
            (isHot apple)
            (atLocation apple table)
            ; The goal is to place the apple on the table to the left of the sponge.
            ; Since the domain doesn't have spatial predicates, we interpret this as:
            ; After heating, the apple must be placed on the table, and we assume the robot
            ; can position it appropriately relative to the sponge.
            ; We'll rely on the final placement action to satisfy this.
            (not (holdsAny robot))
        )
    )
)