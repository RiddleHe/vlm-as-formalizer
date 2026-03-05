(define (problem put_mug_spoon_on_table)
  (:domain put_task)

  (:objects
    robot_agent - agent

    round_black_table_receptacle - receptacle
    white_rectangular_table_receptacle - receptacle
    black_side_shelf_receptacle - receptacle
    black_takeout_container_receptacle - receptacle
    blue_mug_receptacle - receptacle
    gray_bowl_receptacle - receptacle
    metal_cup_receptacle - receptacle

    square_coaster_mat - object
    small_dark_vase - object
    yellow_pencil - object
    metal_fork - object
    white_salt_shaker - object
    tomato - object
    metal_spoon - object
    green_scrubber_pad - object
    brown_egg - object
    amber_pump_bottle_1 - object
    amber_pump_bottle_2 - object
  )

  (:init
    ;; Robot initially not at any location
    ;; Receptacle contents from scene graph
    (inReceptacle small_dark_vase round_black_table_receptacle)
    (inReceptacle yellow_pencil round_black_table_receptacle)
    (inReceptacle metal_fork round_black_table_receptacle)
    (inReceptacle blue_mug_receptacle round_black_table_receptacle)
    (inReceptacle white_salt_shaker round_black_table_receptacle)
    (inReceptacle square_coaster_mat round_black_table_receptacle)

    (inReceptacle tomato white_rectangular_table_receptacle)
    (inReceptacle metal_spoon white_rectangular_table_receptacle)
    (inReceptacle black_takeout_container_receptacle white_rectangular_table_receptacle)

    (inReceptacle gray_bowl_receptacle black_side_shelf_receptacle)
    (inReceptacle metal_cup_receptacle black_side_shelf_receptacle)
    (inReceptacle green_scrubber_pad black_side_shelf_receptacle)
    (inReceptacle brown_egg black_side_shelf_receptacle)
    (inReceptacle amber_pump_bottle_1 black_side_shelf_receptacle)
    (inReceptacle amber_pump_bottle_2 black_side_shelf_receptacle)
    (inReceptacle white_salt_shaker black_side_shelf_receptacle)
  )

  (:goal
    (and
      ;; mug with spoon in it on the table
      (inReceptacle blue_mug_receptacle round_black_table_receptacle)
      (inReceptacle metal_spoon blue_mug_receptacle)
    )
  )
)