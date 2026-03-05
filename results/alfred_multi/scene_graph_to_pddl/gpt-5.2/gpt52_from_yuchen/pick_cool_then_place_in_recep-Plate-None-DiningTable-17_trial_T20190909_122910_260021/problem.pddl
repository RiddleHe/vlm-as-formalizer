(define (problem put_task_problem_1)
  (:domain put_task)
  (:objects
    robot - agent

    white_table_with_lower_shelf - receptacle
    fridge - fridge

    brown_bread_loaf - object
    metal_spoon_left_edge - object
    metal_knife_left_of_bread - knife
    metal_fork_center - object
    salt_shaker_upper_center - object
    pepper_shaker_lower_center - object
    red_apple_right_center - object
    green_lettuce_right - object
    green_rectangular_sponge_back_right - object
  )

  (:init
    ;; objects currently on/in the table receptacle
    (inReceptacle brown_bread_loaf white_table_with_lower_shelf)
    (inReceptacle metal_spoon_left_edge white_table_with_lower_shelf)
    (inReceptacle metal_knife_left_of_bread white_table_with_lower_shelf)
    (inReceptacle metal_fork_center white_table_with_lower_shelf)
    (inReceptacle salt_shaker_upper_center white_table_with_lower_shelf)
    (inReceptacle pepper_shaker_lower_center white_table_with_lower_shelf)
    (inReceptacle red_apple_right_center white_table_with_lower_shelf)
    (inReceptacle green_lettuce_right white_table_with_lower_shelf)
    (inReceptacle green_rectangular_sponge_back_right white_table_with_lower_shelf)
  )

  (:goal
    (and
      ;; interpret "plate" as an available dishware-like item in the scene: metal_spoon_left_edge
      (isCool metal_spoon_left_edge)
      (inReceptacle metal_spoon_left_edge white_table_with_lower_shelf)
    )
  )
)