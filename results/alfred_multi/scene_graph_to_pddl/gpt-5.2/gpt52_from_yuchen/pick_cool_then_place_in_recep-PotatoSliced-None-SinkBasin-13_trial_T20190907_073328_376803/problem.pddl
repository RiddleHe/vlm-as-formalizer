(define (problem put_task_problem_1)
  (:domain put_task)
  (:objects
    robot_agent - agent
    black_french_door_fridge - fridge
    silver_inset_sink_basin - sink
    brown_potato_on_countertop_right - object
  )
  (:init
    (openable black_french_door_fridge)

    (inReceptacle metal_fork_in_sink silver_inset_sink_basin)
    (inReceptacle red_tomato_in_sink silver_inset_sink_basin)
  )
  (:goal
    (and
      (isCool brown_potato_on_countertop_right)
      (isSliced brown_potato_on_countertop_right)
      (inReceptacle brown_potato_on_countertop_right silver_inset_sink_basin)
    )
  )
)