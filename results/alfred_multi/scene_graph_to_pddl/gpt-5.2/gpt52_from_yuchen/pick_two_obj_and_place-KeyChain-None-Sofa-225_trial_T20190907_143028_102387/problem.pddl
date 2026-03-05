(define (problem put_keys_on_couch)
  (:domain put_task)
  (:objects
    robot_agent - agent

    white_slatted_coffee_table - receptacle
    small_white_side_table - receptacle
    black_leather_couch_left_seat - receptacle
    black_leather_couch_right_seat - receptacle
    open_cardboard_box_on_couch - receptacle

    keychain_pair_black_with_red_key - object
    keyring_gold_left_on_side_table - object
    keyring_gold_right_on_side_table - object

    teal_wood_chair - object
    table_lamp_with_white_shade - object
    gray_remote_left_on_slatted_table - object
    gray_remote_right_on_slatted_table - object
    small_green_object_on_slatted_table - object
    small_dark_object_on_slatted_table - object
  )

  (:init
    ;; agent location
    (atLocation robot_agent white_slatted_coffee_table)

    ;; receptacle relations
    (inReceptacle table_lamp_with_white_shade small_white_side_table)
    (inReceptacle keychain_pair_black_with_red_key small_white_side_table)
    (inReceptacle keyring_gold_left_on_side_table small_white_side_table)
    (inReceptacle keyring_gold_right_on_side_table small_white_side_table)

    (inReceptacle gray_remote_left_on_slatted_table white_slatted_coffee_table)
    (inReceptacle gray_remote_right_on_slatted_table white_slatted_coffee_table)
    (inReceptacle small_green_object_on_slatted_table white_slatted_coffee_table)
    (inReceptacle small_dark_object_on_slatted_table white_slatted_coffee_table)

    (inReceptacle open_cardboard_box_on_couch black_leather_couch_right_seat)
  )

  (:goal
    (and
      ;; place both pairs of keys on the couch (either seat counts as couch)
      (or
        (inReceptacle keychain_pair_black_with_red_key black_leather_couch_left_seat)
        (inReceptacle keychain_pair_black_with_red_key black_leather_couch_right_seat)
      )
      (or
        (inReceptacle keyring_gold_left_on_side_table black_leather_couch_left_seat)
        (inReceptacle keyring_gold_left_on_side_table black_leather_couch_right_seat)
      )
      (or
        (inReceptacle keyring_gold_right_on_side_table black_leather_couch_left_seat)
        (inReceptacle keyring_gold_right_on_side_table black_leather_couch_right_seat)
      )
    )
  )
)