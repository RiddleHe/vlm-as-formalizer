(define (problem turn_on_lamp_with_remote)
    (:domain put_task)
    (:objects
        robot - agent
        green_couch - receptacle
        small_table - receptacle
        green_lampshade - object
        red_cushion - object
        remote_control - object
        book - object
    )
    (:init
        (atLocation robot green_couch)
        (inReceptacle remote_control green_couch)
        (inReceptacle book green_couch)
        (inReceptacle red_cushion green_couch)
        (not (isOn green_lampshade))
        (not (holdsAny robot))
    )
    (:goal (and (isOn green_lampshade)))
)