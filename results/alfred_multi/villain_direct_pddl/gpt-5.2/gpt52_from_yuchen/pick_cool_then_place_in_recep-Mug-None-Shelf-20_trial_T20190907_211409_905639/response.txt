(define (problem put_task_mug_chill_rack)
  (:domain put_task)

  (:objects
    robot - agent
    fridge1 - fridge
    rack1 - receptacle
    mug1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; initial containment / locations
    (inReceptacle mug1 rack1)
  )

  (:goal
    (and
      (isCool mug1)
      (inReceptacle mug1 rack1)
    )
  )
)