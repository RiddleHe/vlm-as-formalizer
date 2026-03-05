(define (problem put_task_round_table_pan_fork)
  (:domain put_task)

  (:objects
    robot - agent

    round_table - receptacle
    frying_pan - receptacle
    fork - object
  )

  (:init
    ;; robot starts not at any object's location (so no atLocation facts)

    ;; object locations / containment from the scene
    (inReceptacle frying_pan round_table)

    ;; assume fork is initially on the round table (not in the pan yet)
    (inReceptacle fork round_table)
  )

  (:goal
    (and
      (inReceptacle frying_pan round_table)
      (inReceptacle fork frying_pan)
    )
  )
)