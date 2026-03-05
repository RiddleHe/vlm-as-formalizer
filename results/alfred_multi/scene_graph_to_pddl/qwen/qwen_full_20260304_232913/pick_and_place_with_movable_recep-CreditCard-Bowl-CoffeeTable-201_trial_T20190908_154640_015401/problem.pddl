(define (problem put_bowl_with_credit_card_on_glass_table)
    (:domain put_task)
    (:objects
        agent
        microwave fridge sink - receptacle
        knife - object
        glass_table dining_table - receptacle
        bowl credit_card statue remote_control yellow_vase book tissue_box plate black_bowl white_bowl small_white_bowl small_black_bowl - object
    )
    (:init
        (atLocation agent glass_table) ; agent starts near glass_table for convenience, though not strictly required
        (inReceptacle credit_card glass_table)
        (inReceptacle bowl glass_table)
        (inReceptacle plate glass_table)
        (inReceptacle tissue_box glass_table)
        (inReceptacle black_bowl dining_table)
        (inReceptacle statue dining_table)
        (inReceptacle remote_control dining_table)
        (inReceptacle yellow_vase dining_table)
        (inReceptacle book dining_table)
        ; No objects are initially held
        (not (holdsAny agent))
        ; No receptacles are openable in this scene
        ; No objects are clean, hot, cool, on, toggled, or sliced
        (not (isClean bowl))
        (not (isHot bowl))
        (not (isCool bowl))
        (not (isOn bowl))
        (not (isToggled bowl))
        (not (isSliced bowl))
    )
    (:goal
        (and
            (inReceptacle bowl glass_table)
            (inReceptacle credit_card bowl)
        )
    )
)