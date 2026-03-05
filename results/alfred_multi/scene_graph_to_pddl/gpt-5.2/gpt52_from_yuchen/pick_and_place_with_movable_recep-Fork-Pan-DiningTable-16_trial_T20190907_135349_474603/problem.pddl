(define (problem put_frying_pan_with_fork_on_round_table)
  (:domain put_task)

  (:objects
    agent1 - agent

    round_white_table_receptacle - receptacle

    green_box_near_table_center - object
    white_paper_towel_roll_upright - object
    two_green_cucumber_like_items_right_side - object
    small_brown_egg_right_edge - object
    brown_potato_near_table_front - object
    dark_green_wine_bottle_front_right - object
    yellow_pen_left_side - object
    thin_stick_like_tool_left_center - object
    small_metal_fork_like_utensil_near_table_front_center - object
    gray_spatula_on_counter_right - object
    brown_loaf_of_bread_on_counter_left - object
  )

  (:init
    (inReceptacle green_box_near_table_center round_white_table_receptacle)
    (inReceptacle white_paper_towel_roll_upright round_white_table_receptacle)
    (inReceptacle two_green_cucumber_like_items_right_side round_white_table_receptacle)
    (inReceptacle small_brown_egg_right_edge round_white_table_receptacle)
    (inReceptacle brown_potato_near_table_front round_white_table_receptacle)
    (inReceptacle dark_green_wine_bottle_front_right round_white_table_receptacle)
    (inReceptacle yellow_pen_left_side round_white_table_receptacle)
    (inReceptacle thin_stick_like_tool_left_center round_white_table_receptacle)
    (inReceptacle small_metal_fork_like_utensil_near_table_front_center round_white_table_receptacle)
  )

  (:goal
    (and
      (inReceptacle small_metal_fork_like_utensil_near_table_front_center round_white_table_receptacle)
    )
  )
)