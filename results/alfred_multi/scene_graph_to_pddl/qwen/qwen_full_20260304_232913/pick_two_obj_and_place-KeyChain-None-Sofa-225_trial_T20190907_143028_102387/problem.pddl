(define (problem put_keys_on_couch)
    (:domain put_task)
    (:objects
        robot - agent
        white_wooden_pallet - receptacle
        white_side_table - receptacle
        open_cardboard_box_on_couch - receptacle
        small_green_box_on_white_pallet - object
        small_black_object_on_white_pallet - object
        two_gray_remote_controls_on_white_pallet - object
        two_pairs_of_keys_on_white_pallet - object
        two_pairs_of_keys_on_white_side_table - object
        small_red_handled_knife_on_white_table - object
    )
    (:init
        (openable white_wooden_pallet)
        (openable white_side_table)
        (openable open_cardboard_box_on_couch)
        (opened open_cardboard_box_on_couch)
        (inReceptacle small_green_box_on_white_pallet white_wooden_pallet)
        (inReceptacle small_black_object_on_white_pallet white_wooden_pallet)
        (inReceptacle two_gray_remote_controls_on_white_pallet white_wooden_pallet)
        (inReceptacle two_pairs_of_keys_on_white_pallet white_wooden_pallet)
        (inReceptacle two_pairs_of_keys_on_white_side_table white_side_table)
        (not (atLocation robot white_wooden_pallet))
        (not (atLocation robot white_side_table))
        (not (atLocation robot open_cardboard_box_on_couch))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle two_pairs_of_keys_on_white_pallet open_cardboard_box_on_couch)
            (inReceptacle two_pairs_of_keys_on_white_side_table open_cardboard_box_on_couch)
        )
    )
)