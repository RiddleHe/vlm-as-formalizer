(define (problem put_task_bread_fridge_counter)
  (:domain put_task)

  (:objects
    robot_agent - agent

    tall_stainless_fridge_left - fridge
    beige_countertop_right beige_countertop_left - receptacle

    butter_knife_on_counter_center - knife

    loaf_of_bread_on_right_counter
    red_apple_on_left_counter_front_right
    black_toaster_on_right_counter
    red_tomato_near_bread
    green_cabbage_on_left_counter_back_left
    brown_potato_on_left_counter_front_left
    metal_spoon_on_left_counter_front_left
    wooden_knife_block_or_utensil_holder_right_of_cabbage
    black_wok_on_stove_right
    white_stove_top_right_burner
    white_stove_top_left_burner
    - object
  )

  (:init
    (openable tall_stainless_fridge_left)

    ;; object placements (modeled as being in receptacles/surfaces)
    (inReceptacle black_toaster_on_right_counter beige_countertop_right)
    (inReceptacle loaf_of_bread_on_right_counter beige_countertop_right)
    (inReceptacle red_tomato_near_bread beige_countertop_right)

    (inReceptacle green_cabbage_on_left_counter_back_left beige_countertop_left)
    (inReceptacle brown_potato_on_left_counter_front_left beige_countertop_left)
    (inReceptacle metal_spoon_on_left_counter_front_left beige_countertop_left)
    (inReceptacle butter_knife_on_counter_center beige_countertop_left)
    (inReceptacle red_apple_on_left_counter_front_right beige_countertop_left)
    (inReceptacle wooden_knife_block_or_utensil_holder_right_of_cabbage beige_countertop_left)

    (inReceptacle black_wok_on_stove_right white_stove_top_right_burner)

    ;; robot starts with no location and empty hands (so no holds/holdsAny/atLocation facts)
  )

  (:goal
    (and
      ;; cut/slice the bread
      (isSliced loaf_of_bread_on_right_counter)

      ;; after being put in and removed from the fridge, it ends up on the counter with the apple
      (inReceptacle loaf_of_bread_on_right_counter beige_countertop_left)
      (inReceptacle red_apple_on_left_counter_front_right beige_countertop_left)
    )
  )
)