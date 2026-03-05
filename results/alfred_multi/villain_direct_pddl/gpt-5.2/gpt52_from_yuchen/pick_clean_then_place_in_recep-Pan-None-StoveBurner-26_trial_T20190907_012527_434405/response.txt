(define (problem rinse_pan_scene)
  (:domain put_task)
  (:objects
    robot - agent
    sink1 - sink
    microwave1 - microwave
    pan1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; object locations / containment
    (inReceptacle pan1 sink1)

    ;; robot initially not at any object's location (no atLocation facts)
  )

  (:goal
    (and
      (isClean pan1)
    )
  )
)