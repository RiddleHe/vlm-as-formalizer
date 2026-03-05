(define (problem put_task_heated_potato_in_sink)
  (:domain put_task)

  (:objects
    robot_agent - agent
    red_black_countertop_microwave_off - microwave
    double_basin_metal_sink - sink
    brown_potato_in_left_sink_basin - object
    brown_egg_in_left_sink_basin - object
    green_lettuce_in_right_sink_basin - object
  )

  (:init
    (openable red_black_countertop_microwave_off)

    (inReceptacle brown_potato_in_left_sink_basin double_basin_metal_sink)
    (inReceptacle brown_egg_in_left_sink_basin double_basin_metal_sink)
    (inReceptacle green_lettuce_in_right_sink_basin double_basin_metal_sink)
  )

  (:goal
    (and
      (isHot brown_potato_in_left_sink_basin)
      (inReceptacle brown_potato_in_left_sink_basin double_basin_metal_sink)
    )
  )
)