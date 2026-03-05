(define (problem put_task_chill_pan_put_in_sink)
  (:domain put_task)

  (:objects
    robot - agent
    fridge1 - fridge
    sink1 - sink
    pan1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; initial containment / locations inferred from scene
    ;; pan is on the counter (modeled as just being at its own location, not in a receptacle)

    ;; robot initially not at any object's location (no atLocation facts for robot)

    ;; nothing is opened/held/clean/hot/cool initially
  )

  (:goal
    (and
      (isCool pan1)
      (inReceptacle pan1 sink1)
    )
  )
)