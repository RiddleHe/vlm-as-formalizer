(define (problem put_task_kitchen_clean_mug_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 - sink
    microwave1 - microwave
    fridge1 - fridge

    mug1 - object
    table1 - receptacle
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; object locations / containment
    (inReceptacle mug1 sink1)

    ;; table is a receptacle (can hold objects); no need to be openable
    ;; robot starts not at any location (no atLocation facts)

    ;; mug is initially not clean
  )

  (:goal
    (and
      (isClean mug1)
      (inReceptacle mug1 table1)
    )
  )
)