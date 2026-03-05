(define (problem bathroom_clean_rag_to_toilet)
  (:domain put_task)
  (:objects
    robot - agent
    sink_left sink_right - sink
    toilet - receptacle
    rag - object
  )
  (:init
    ;; robot starts not at any object's location (no atLocation facts)

    ;; receptacle relations from the scene
    (inReceptacle rag sink_left)

    ;; rag must be cleaned for the task
    (isClean rag)
  )
  (:goal
    (and
      (inReceptacle rag toilet)
      (isClean rag)
    )
  )
)