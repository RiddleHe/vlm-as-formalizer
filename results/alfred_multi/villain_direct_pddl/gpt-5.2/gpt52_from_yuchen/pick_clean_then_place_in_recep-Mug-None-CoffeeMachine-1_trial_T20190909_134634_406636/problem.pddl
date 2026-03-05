(define (problem wash_mug_put_in_coffeemaker)
  (:domain put_task)
  (:objects
    robot - agent

    sink1 - sink
    coffeemaker1 - receptacle

    mug1 - object
  )

  (:init
    ;; receptacle properties
    ;; (openable ...) not specified for any receptacle in this scene

    ;; object locations / containment
    (inReceptacle mug1 coffeemaker1)

    ;; robot initially not at any object's location (so no atLocation facts)
  )

  (:goal
    (and
      (isClean mug1)
      (inReceptacle mug1 coffeemaker1)
    )
  )
)