(define (problem put_keys_on_couch)
    (:domain put_task)
    (:objects
        agent
        white_pallet
        white_side_table
        black_couch
        open_cardboard_box
        gray_remote_control_1
        gray_remote_control_2
        small_black_keychain_1
        small_black_keychain_2
        green_box
        brown_bowl
        light_blue_chair
        microwave
        fridge
        sink
        knife
    )
    (:init
        (openable white_pallet)
        (openable white_side_table)
        (openable black_couch)
        (openable open_cardboard_box)
        (opened open_cardboard_box)
        (inReceptacle gray_remote_control_1 white_pallet)
        (inReceptacle gray_remote_control_2 white_pallet)
        (inReceptacle small_black_keychain_1 white_pallet)
        (inReceptacle small_black_keychain_2 white_pallet)
        (inReceptacle green_box white_pallet)
        (inReceptacle brown_bowl white_side_table)
        (inReceptacle small_black_keychain_1 white_side_table)
        (inReceptacle small_black_keychain_2 white_side_table)
        (inReceptacle open_cardboard_box black_couch)
        (not (holdsAny agent))
    )
    (:goal (and
        (inReceptacle small_black_keychain_1 black_couch)
        (inReceptacle small_black_keychain_2 black_couch)
    ))
)