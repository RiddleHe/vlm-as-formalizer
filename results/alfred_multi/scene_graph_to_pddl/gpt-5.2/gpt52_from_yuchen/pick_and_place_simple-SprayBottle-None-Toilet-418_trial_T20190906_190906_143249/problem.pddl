(define (problem put_task_spray_on_toilet)
  (:domain put_task)
  (:objects
    agent_robot - agent

    sink_bowl_round_brown_on_counter - sink
    toilet_black_base - receptacle

    spray_bottle_teal_with_white_nozzle - object
    toilet_paper_roll_white - object
    candle_thin_yellow - object
    cloth_rag_white - object
    soap_bar_pink - object
    cardboard_tube_brown - object
  )

  (:init
    ;; Robot starts not at any location (no atLocation facts)

    ;; Objects currently in the sink/counter area (modeled as in the sink receptacle)
    (inReceptacle spray_bottle_teal_with_white_nozzle sink_bowl_round_brown_on_counter)
    (inReceptacle toilet_paper_roll_white sink_bowl_round_brown_on_counter)
    (inReceptacle candle_thin_yellow sink_bowl_round_brown_on_counter)
    (inReceptacle cloth_rag_white sink_bowl_round_brown_on_counter)

    ;; Other observed objects (locations not specified by the scene graph)
    ;; soap_bar_pink, cardboard_tube_brown, toilet_black_base
  )

  (:goal
    (and
      (inReceptacle spray_bottle_teal_with_white_nozzle toilet_black_base)
    )
  )
)