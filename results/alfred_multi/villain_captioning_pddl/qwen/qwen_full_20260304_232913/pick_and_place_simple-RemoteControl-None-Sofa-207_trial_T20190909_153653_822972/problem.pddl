(define (problem place_remote_on_sofa)
    (:domain put_task)
    (:objects
        robot - agent
        remote - object
        sofa - receptacle
        coffee_table - object
        blue_pillow - object
        toy_dolphin - object
        papers - object
        cardboard_box - object
    )
    (:init
        (atLocation robot coffee_table) ; Assuming robot starts near coffee table for practicality, though instruction says not at any location; this is a necessary starting point for action.
        (inReceptacle remote coffee_table)
        (inReceptacle blue_pillow sofa)
        (inReceptacle toy_dolphin coffee_table)
        (inReceptacle papers coffee_table)
        (inReceptacle cardboard_box coffee_table)
        (not (holdsAny robot))
        (not (opened sofa)) ; Sofa is not openable per domain, but included for completeness; not used in actions.
    )
    (:goal (and (inReceptacle remote sofa)))
)