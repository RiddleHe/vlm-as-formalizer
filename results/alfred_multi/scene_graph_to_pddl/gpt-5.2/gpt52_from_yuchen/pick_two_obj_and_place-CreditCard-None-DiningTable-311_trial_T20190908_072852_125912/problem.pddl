(define (problem move_two_credit_cards_to_table)
  (:domain put_task)

  (:objects
    agent1 - agent

    white_tv_stand_with_drawers - receptacle
    dark_wood_table_desk - receptacle

    red_credit_card_near_tv_base_left - object
    red_credit_card_near_tv_base_right - object
    flat_screen_tv_on_tv_stand - object
    blue_thin_stick_on_tv_stand_near_tv_base - object
    black_pen_like_object_on_tv_stand_right - knife
    laptop_on_table_desk - object
    white_mug_on_table_desk_right - object
    keys_with_keychain_on_table_desk_left - object
    tape_dispenser_on_table_desk_far_left - object
    closed_book_on_table_desk_far_right - object
    desk_lamp_on_table_desk_back_right - object
    green_couch_right - object
    two_brown_chairs_at_table - object
  )

  (:init
    ;; agent starts not at any location and holding nothing
    ;; (no atLocation facts)
    ;; (no holds / holdsAny facts)

    ;; receptacle containment relations from the scene graph
    (inReceptacle flat_screen_tv_on_tv_stand white_tv_stand_with_drawers)
    (inReceptacle red_credit_card_near_tv_base_left white_tv_stand_with_drawers)
    (inReceptacle red_credit_card_near_tv_base_right white_tv_stand_with_drawers)
    (inReceptacle blue_thin_stick_on_tv_stand_near_tv_base white_tv_stand_with_drawers)
    (inReceptacle black_pen_like_object_on_tv_stand_right white_tv_stand_with_drawers)

    (inReceptacle laptop_on_table_desk dark_wood_table_desk)
    (inReceptacle white_mug_on_table_desk_right dark_wood_table_desk)
    (inReceptacle keys_with_keychain_on_table_desk_left dark_wood_table_desk)
    (inReceptacle tape_dispenser_on_table_desk_far_left dark_wood_table_desk)
    (inReceptacle closed_book_on_table_desk_far_right dark_wood_table_desk)
    (inReceptacle desk_lamp_on_table_desk_back_right dark_wood_table_desk)
  )

  (:goal
    (and
      (inReceptacle red_credit_card_near_tv_base_left dark_wood_table_desk)
      (inReceptacle red_credit_card_near_tv_base_right dark_wood_table_desk)
    )
  )
)