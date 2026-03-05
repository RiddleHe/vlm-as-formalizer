(define (problem bathroom_put_tp_on_toilet_back)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 sink2 - sink
    toiletBack - sink

    tp_full - object
    tp_empty - object
  )

  (:init
    ;; Robot starts not at any location (no atLocation facts)

    ;; Known receptacles in the scene
    ;; (sinks are receptacles by type; no open/close behavior modeled)
    (inReceptacle tp_full sink1)
    (inReceptacle tp_empty sink1)
  )

  (:goal
    (and
      (inReceptacle tp_full toiletBack)
      (inReceptacle tp_empty toiletBack)
    )
  )
)