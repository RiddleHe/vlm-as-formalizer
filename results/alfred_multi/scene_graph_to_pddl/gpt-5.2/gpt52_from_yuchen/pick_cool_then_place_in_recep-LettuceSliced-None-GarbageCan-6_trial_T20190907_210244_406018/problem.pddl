(define (problem put_task_lettuce_cold_to_garbage)
  (:domain put_task)

  (:objects
    robot_agent - agent

    black_fridge_front - fridge
    white_garbage_can_by_counter - receptacle

    green_lettuce_on_island - object
    red_tomato_in_garbage_can - object
    green_handle_knife_on_island - knife
    silver_knife_on_right_counter - object
    bread_loaf_on_island - object
    frying_pan_on_island - object
    metal_spoon_on_island - object
    metal_fork_on_island - object
    black_mug_on_island - object
    green_plate_left_on_island - object
    green_plate_center_on_island - object
    metal_spatula_on_island - object
    paper_photos_stack_on_island - object
  )

  (:init
    (openable black_fridge_front)

    (inReceptacle red_tomato_in_garbage_can white_garbage_can_by_counter)
  )

  (:goal
    (and
      (isCool green_lettuce_on_island)
      (inReceptacle green_lettuce_on_island white_garbage_can_by_counter)
    )
  )
)