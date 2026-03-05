(define (problem put_task_teapot_clean_on_stove)
  (:domain put_task)

  (:objects
    robot - agent
    sink1 - sink
    stove1 - receptacle
    teapot1 - object
  )

  (:init
    ;; receptacle facts
    (openable sink1)

    ;; object containment / locations from the scene
    (inReceptacle teapot1 stove1)

    ;; robot initially not at any object's location (no atLocation facts)
  )

  (:goal
    (and
      (isClean teapot1)
      (inReceptacle teapot1 stove1)
    )
  )
)