(define (problem put_task_heated_tomato_in_sink)
  (:domain put_task)
  (:objects
    robot_agent - agent
    red_countertop_microwave - microwave
    stainless_double_sink - sink

    tomato_left_on_counter - object
    tomato_right_on_counter - object
    red_apple_in_sink - object
    pot_on_stovetop - object
    paper_towel_roll_upright - object
    loaf_of_bread - object
    metal_spatula - object
    green_cabbage_left_edge - object
    two_potatoes_on_drainboard - object
  )

  (:init
    (openable red_countertop_microwave)
    (inReceptacle red_apple_in_sink stainless_double_sink)
  )

  (:goal
    (and
      (isHot tomato_left_on_counter)
      (inReceptacle tomato_left_on_counter stainless_double_sink)
    )
  )
)