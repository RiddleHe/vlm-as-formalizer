(define (problem put_task_rinsed_cloth_in_cabinet)
  (:domain put_task)

  (:objects
    robot_agent - agent

    bathroom_sink_basin - sink
    under_sink_cabinet_left under_sink_cabinet_right - receptacle

    red_cloth_left_counter
    pink_soap_bar_in_sink
    green_candle_left_counter
    purple_spray_bottle_counter
    blue_trash_bin_receptacle
    - object
  )

  (:init
    ;; receptacle properties
    (openable under_sink_cabinet_left)
    (openable under_sink_cabinet_right)

    ;; object containment
    (inReceptacle pink_soap_bar_in_sink bathroom_sink_basin)
  )

  (:goal
    (and
      (isClean red_cloth_left_counter)
      (inReceptacle red_cloth_left_counter under_sink_cabinet_left)
    )
  )
)