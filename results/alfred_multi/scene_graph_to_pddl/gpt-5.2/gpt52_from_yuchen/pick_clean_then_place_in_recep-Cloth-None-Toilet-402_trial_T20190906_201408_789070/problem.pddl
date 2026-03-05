(define (problem put_cleaned_rag_on_toilet_tank_lid)
  (:domain put_task)
  (:objects
    robot - agent

    left_square_bathroom_sink_basin - sink
    right_square_bathroom_sink_basin - sink

    white_toilet_tank_lid_surface - receptacle

    purple_cleaning_rag_between_sinks - object
    yellow_cylindrical_item_between_sinks - object
    yellow_cylindrical_item_on_toilet_tank_lid - object
  )

  (:init
    ;; Object placements (from scene graph)
    (inReceptacle purple_cleaning_rag_between_sinks left_square_bathroom_sink_basin)
    (inReceptacle yellow_cylindrical_item_between_sinks left_square_bathroom_sink_basin)
    (inReceptacle yellow_cylindrical_item_on_toilet_tank_lid white_toilet_tank_lid_surface)

    ;; Robot starts not holding anything and not at any location (no atLocation facts).
    ;; No objects are initially marked clean/hot/cool/on/toggled/sliced.
  )

  (:goal
    (and
      (isClean purple_cleaning_rag_between_sinks)
      (inReceptacle purple_cleaning_rag_between_sinks white_toilet_tank_lid_surface)
    )
  )
)