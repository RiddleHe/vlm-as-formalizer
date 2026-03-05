(define (problem bathroom_rag_clean_toilet_tank)
  (:domain put_task)

  (:objects
    robot - agent

    sink_left sink_right - sink
    toilet_tank_lid - receptacle

    rag_purple candle_yellow toilet_paper_roll - object
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts)

    ;; Receptacle relationships (support surfaces / containers)
    (inReceptacle toilet_paper_roll toilet_tank_lid)

    ;; No objects are initially in either sink (rag is on the counter, not in a sink)
    ;; Rag is not initially clean (so no (isClean rag_purple))
    ;; Robot holds nothing initially (so no (holdsAny robot) and no (holds robot ...))
  )

  (:goal
    (and
      (isClean rag_purple)
      (inReceptacle rag_purple toilet_tank_lid)
    )
  )
)