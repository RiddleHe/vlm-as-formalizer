(define (problem puttask_warm_apple)
  (:domain put_task)
  (:objects
    robot - agent
    microwave_red_countertop_right - microwave
    square_black_pan_left - object
    oval_brown_bread_loaf_center - object
    salt_shaker_coppercap_left_of_bread - object
    salt_shaker_coppercap_below_bread - object
    salt_shaker_coppercap_right_of_tomato - object
    metal_fork_top_right - object
    apple_yellow_top_right_1 - object
    apple_yellow_top_right_2 - object
    apple_yellow_mid_right - object
    tomato_red_right - object
  )

  (:init
    (openable microwave_red_countertop_right)
  )

  (:goal
    (and
      (isHot apple_yellow_mid_right)
    )
  )
)