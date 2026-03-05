(define (problem put_task_clean_spoon_put_away)
  (:domain put_task)

  (:objects
    robot - agent
    red_countertop_microwave - microwave
    double_basin_stainless_sink - sink
    yellow_banana_on_left_table - object
  )

  (:init
    (openable red_countertop_microwave)
  )

  (:goal
    (and
      (isClean yellow_banana_on_left_table)
      (inReceptacle yellow_banana_on_left_table red_countertop_microwave)
    )
  )
)