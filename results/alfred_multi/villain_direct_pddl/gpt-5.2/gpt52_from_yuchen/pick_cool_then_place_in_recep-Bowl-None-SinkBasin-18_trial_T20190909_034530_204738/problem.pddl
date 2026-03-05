(define (problem put_task_chilled_black_bowl_in_sink)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    sink1 - sink

    black_bowl1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; initial object locations
    (inReceptacle black_bowl1 fridge1)

    ;; robot starts with no location and holds nothing
    (not (holdsAny robot))

    ;; bowl is already chilled
    (isCool black_bowl1)
  )

  (:goal
    (and
      (inReceptacle black_bowl1 sink1)
      (isCool black_bowl1)
    )
  )
)