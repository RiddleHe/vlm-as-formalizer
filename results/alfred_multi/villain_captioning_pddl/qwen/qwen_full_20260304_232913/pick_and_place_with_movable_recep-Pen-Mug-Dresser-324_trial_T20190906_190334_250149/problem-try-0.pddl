(define (problem put_pen_in_cup)
    (:domain put_task)
    (:objects
        robot - agent
        pen - object
        black_cup - receptacle
        dresser - object
        side_table - object
        laptop - object
        lamp - object
        smartphone - object
        keys - object
        radio - object
        book1 book2 book3 book4 - object
    )
    (:init
        ; Agent is not at any location initially
        (not (atLocation robot pen))
        (not (atLocation robot black_cup))
        (not (atLocation robot dresser))
        (not (atLocation robot side_table))

        ; Pen is on the dresser
        (atLocation pen dresser)

        ; Black cup is on the side table
        (atLocation black_cup side_table)

        ; Other objects are at their locations
        (atLocation laptop dresser)
        (atLocation lamp dresser)
        (atLocation smartphone dresser)
        (atLocation keys side_table)
        (atLocation radio side_table)
        (atLocation book1 side_table)
        (atLocation book2 side_table)
        (atLocation book3 side_table)
        (atLocation book4 side_table)

        ; Cup is not openable (as per domain, simple receptacle)
        (not (openable black_cup))

        ; Agent is not holding anything
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle pen black_cup)
        )
    )
)