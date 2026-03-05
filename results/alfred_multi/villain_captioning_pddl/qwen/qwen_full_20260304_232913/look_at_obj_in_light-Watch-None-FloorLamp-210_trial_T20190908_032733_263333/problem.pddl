(define (problem get_ring_and_turn_on_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        wristwatch - object
        statue - object
        television - object
        lamp - object
        table - object
    )
    (:init
        (atLocation robot table) ; Assuming robot starts near table for practicality; if not, it must first go to table
        (not (holdsAny robot))
        (not (isOn lamp))
        (not (isToggled lamp))
        ; Objects are on the table or floor; no receptacles present
        ; Wristwatch is on the table
        ; Lamp is on the floor, not on table
    )
    (:goal (and
        (holds robot wristwatch)
        (isOn lamp)
    ))
)