(define (problem put_task_apple_slice_microwave_shelf)
  (:domain put_task)
  (:objects
    robot_agent - agent

    stainless_microwave_above_counter - microwave
    stainless_sink_in_left_counter - sink

    black_handle_knife_in_sink - knife

    red_apple_on_small_black_side_table - object
    small_black_side_table - receptacle
    round_black_dining_table - receptacle
    stainless_microwave_above_counter - receptacle
    stainless_sink_in_left_counter - receptacle
  )

  (:init
    (openable stainless_microwave_above_counter)
  )

  (:goal
    (and
      (isSliced red_apple_on_small_black_side_table)
      (isHot red_apple_on_small_black_side_table)
      (inReceptacle red_apple_on_small_black_side_table small_black_side_table)
    )
  )
)