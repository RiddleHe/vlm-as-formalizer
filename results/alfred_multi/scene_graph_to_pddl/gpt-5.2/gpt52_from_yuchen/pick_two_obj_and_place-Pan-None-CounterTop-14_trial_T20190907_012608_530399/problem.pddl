(define (problem put_task_pans_on_counter)
  (:domain put_task)
  (:objects
    robot - agent

    microwave_black_right_counter - microwave

    pan_large_front_right_handle - object
    pan_small_back_right - object

    mixing_bowl_metal_left_burner - object
    bread_loaf_on_counter - object
    lettuce_head_on_counter - object
    green_plastic_cup_left_counter - object
    spoon_left_counter - object
    spoon_right_counter - object
    butter_knife_left_counter - object
  )

  (:init
    (openable microwave_black_right_counter)
  )

  (:goal
    (and
      (inReceptacle pan_large_front_right_handle microwave_black_right_counter)
      (inReceptacle pan_small_back_right microwave_black_right_counter)
    )
  )
)