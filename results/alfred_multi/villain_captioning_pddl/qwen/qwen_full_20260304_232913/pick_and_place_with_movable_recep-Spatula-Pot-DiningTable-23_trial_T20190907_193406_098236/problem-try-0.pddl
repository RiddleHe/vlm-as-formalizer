(define (problem put_pot_with_spatula_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        table - receptacle
        pot1 pot2 - receptacle
        spatula - object
        knife - object
        frying_pan - receptacle
        shelf - receptacle
        stove - object  ; stove is not a receptacle in this domain, but we need to reference its location
    )
    (:init
        ; Initial locations: robot is not at any object
        (not (atLocation robot table))
        (not (atLocation robot pot1))
        (not (atLocation robot pot2))
        (not (atLocation robot spatula))
        (not (atLocation robot knife))
        (not (atLocation robot frying_pan))
        (not (atLocation robot shelf))
        (not (atLocation robot stove))

        ; Spatula is inside pot1, which is on the stove
        (inReceptacle spatula pot1)
        ; Pot1 and pot2 are on the stove (stove is treated as a location, not a receptacle)
        (atLocation pot1 stove)
        (atLocation pot2 stove)

        ; Knife and frying pan are on the table
        (atLocation knife table)
        (atLocation frying_pan table)

        ; Shelf is under the table, holding other items (not relevant to task)
        (atLocation shelf table)

        ; No object is held by the robot
        (not (holdsAny robot))

        ; No cleaning, heating, cooling, or slicing has occurred
        (not (isClean spatula))
        (not (isHot spatula))
        (not (isCool spatula))
        (not (isSliced spatula))
        (not (isClean pot1))
        (not (isHot pot1))
        (not (isCool pot1))
        (not (isSliced pot1))

        ; Pots are not openable (no openable predicate)
        (not (openable pot1))
        (not (openable pot2))

        ; Table is not openable
        (not (openable table))
    )
    (:goal
        (and
            ; The pot (pot1) with the spatula inside it is on the table
            (inReceptacle spatula pot1)
            (atLocation pot1 table)
        )
    )
)