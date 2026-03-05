(define (problem put_keys_on_couch)
    (:domain put_task)
    (:objects
        agent
        white_pallet
        white_side_table
        black_couch
        open_cardboard_box
        pair_of_keys_1
        pair_of_keys_2
        pair_of_keys_3
        pair_of_keys_4
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
        (opened white_pallet)
        (opened white_side_table)
        (opened black_couch)
        (opened open_cardboard_box)
        (inReceptacle pair_of_keys_1 white_pallet)
        (inReceptacle pair_of_keys_2 white_pallet)
        (inReceptacle pair_of_keys_3 white_side_table)
        (inReceptacle pair_of_keys_4 white_side_table)
    )
    (:goal (and
        (inReceptacle pair_of_keys_1 black_couch)
        (inReceptacle pair_of_keys_2 black_couch)
        (inReceptacle pair_of_keys_3 black_couch)
        (inReceptacle pair_of_keys_4 black_couch)
    ))
)