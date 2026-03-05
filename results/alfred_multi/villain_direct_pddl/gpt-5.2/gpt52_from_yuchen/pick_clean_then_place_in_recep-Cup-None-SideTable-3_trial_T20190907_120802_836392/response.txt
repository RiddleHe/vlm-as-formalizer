(define (problem put_clean_mug_on_table)
  (:domain put_task)
  (:objects
    robot - agent

    sink1 - sink
    microwave1 - microwave
    fridge1 - fridge
    table1 - receptacle

    mug1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; object locations (robot must go somewhere first)
    (inReceptacle mug1 sink1)

    ;; assume table is a receptacle location for placing items
    ;; (no initial inReceptacle facts needed for table)

    ;; robot starts not at any object's location (no atLocation facts)
  )

  (:goal
    (and
      (isClean mug1)
      (inReceptacle mug1 table1)
    )
  )
)