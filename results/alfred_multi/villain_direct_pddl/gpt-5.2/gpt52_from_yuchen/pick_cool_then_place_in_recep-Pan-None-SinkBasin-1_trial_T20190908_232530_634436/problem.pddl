(define (problem chill-pan-put-in-sink)
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

    ;; initial object locations (from the scene)
    (inReceptacle pan1 fridge1)

    ;; robot starts not at any location (so no atLocation facts for robot)
  )

  (:goal
    (and
      (isCool pan1)
      (inReceptacle pan1 sink1)
    )
  )
)