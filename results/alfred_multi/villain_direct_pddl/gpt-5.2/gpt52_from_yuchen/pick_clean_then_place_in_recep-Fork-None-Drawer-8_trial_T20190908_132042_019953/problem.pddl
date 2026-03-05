(define (problem put_clean_fork_in_drawer)
  (:domain put_task)
  (:objects
    robot - agent
    fork - object
    drawer - receptacle
    sink - sink
  )

  (:init
    ;; receptacle properties
    (openable drawer)

    ;; initial object placements (from scene)
    (inReceptacle fork drawer)

    ;; robot initially not at any object's location (no atLocation facts)

    ;; fork must be clean per instruction
    (isClean fork)
  )

  (:goal
    (and
      (isClean fork)
      (inReceptacle fork drawer)
    )
  )
)