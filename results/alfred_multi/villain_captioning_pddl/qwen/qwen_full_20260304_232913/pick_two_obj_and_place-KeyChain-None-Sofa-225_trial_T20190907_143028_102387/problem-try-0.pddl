(define (problem put_keys_on_couch)
    (:domain put_task)
    (:objects
        robot - agent
        couch - object
        side_table - object
        cardboard_box - object
        chair - object
        keys_red_keychain - object
        keys_circular_keyring - object
    )
    (:init
        (atLocation robot side_table)
        (inReceptacle keys_red_keychain side_table)
        (inReceptacle keys_circular_keyring side_table)
        (inReceptacle cardboard_box couch)
    )
    (:goal
        (and
            (inReceptacle keys_red_keychain couch)
            (inReceptacle keys_circular_keyring couch)
        )
    )
)