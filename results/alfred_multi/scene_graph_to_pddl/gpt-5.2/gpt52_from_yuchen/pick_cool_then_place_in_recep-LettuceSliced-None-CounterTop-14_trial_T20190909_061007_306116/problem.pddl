(define (problem put_task_lettuce_slice_cold_on_counter)
  (:domain put_task)

  (:objects
    robot_agent - agent

    white_double_door_fridge_freezer - fridge
    silver_left_counter_sink - sink

    yellow_handle_counter_knife - knife

    round_green_lettuce_head - object
    black_glass_stovetop_surface - receptacle
  )

  (:init
    ;; receptacle properties
    (openable white_double_door_fridge_freezer)

    ;; known containment
    (inReceptacle egg_in_sink silver_left_counter_sink)
  )

  (:goal
    (and
      (isSliced round_green_lettuce_head)
      (isCool round_green_lettuce_head)
      (inReceptacle round_green_lettuce_head black_glass_stovetop_surface)
    )
  )
)