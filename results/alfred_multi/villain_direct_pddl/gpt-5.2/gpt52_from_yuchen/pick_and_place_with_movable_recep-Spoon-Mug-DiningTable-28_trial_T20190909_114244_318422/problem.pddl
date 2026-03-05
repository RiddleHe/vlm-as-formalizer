(define (problem put_mug_spoon_on_table)
  (:domain put_task)
  (:objects
    robot - agent
    table - receptacle
    mug - receptacle
    spoon - object
  )
  (:init
    ;; robot starts not at any object location (no atLocation facts)

    ;; receptacle relations from the scene
    (inReceptacle mug table)
  )
  (:goal
    (and
      (inReceptacle mug table)
      (inReceptacle spoon mug)
    )
  )
)