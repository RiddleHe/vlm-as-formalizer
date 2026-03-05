(define (problem put_cd_to_dresser)
  (:domain put_task)
  (:objects
    robot_agent - agent

    wooden_desk_tabletop_receptacle - receptacle
    tall_wooden_dresser_top_receptacle - receptacle

    white_shade_table_lamp - object
    black_digital_clock_cube - object
    black_mug_left - object
    black_mug_right - object
    cd_disc_left_on_desk - object
    cd_disc_right_on_desk - object
    blue_card_on_desk - object
    gray_bag_on_desk - object
    black_smartphone_on_desk - object
    blue_white_book_on_dresser - object
  )

  (:init
    ;; receptacle contents
    (inReceptacle white_shade_table_lamp wooden_desk_tabletop_receptacle)
    (inReceptacle black_digital_clock_cube wooden_desk_tabletop_receptacle)
    (inReceptacle black_mug_left wooden_desk_tabletop_receptacle)
    (inReceptacle black_mug_right wooden_desk_tabletop_receptacle)
    (inReceptacle cd_disc_left_on_desk wooden_desk_tabletop_receptacle)
    (inReceptacle cd_disc_right_on_desk wooden_desk_tabletop_receptacle)
    (inReceptacle blue_card_on_desk wooden_desk_tabletop_receptacle)
    (inReceptacle gray_bag_on_desk wooden_desk_tabletop_receptacle)
    (inReceptacle black_smartphone_on_desk wooden_desk_tabletop_receptacle)

    (inReceptacle blue_white_book_on_dresser tall_wooden_dresser_top_receptacle)

    ;; agent location
    (atLocation robot_agent wooden_desk_tabletop_receptacle)
  )

  (:goal
    (and
      (inReceptacle cd_disc_left_on_desk tall_wooden_dresser_top_receptacle)
    )
  )
)