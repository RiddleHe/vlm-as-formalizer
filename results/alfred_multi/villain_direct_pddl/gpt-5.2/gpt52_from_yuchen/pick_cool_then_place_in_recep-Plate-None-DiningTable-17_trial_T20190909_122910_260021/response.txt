(define (problem put_task_chilled_plate_on_table)
  (:domain put_task)
  (:objects
    robot - agent

    fridge1 - fridge
    table1 - receptacle

    plate1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; initial containment / locations
    (inReceptacle plate1 fridge1)

    ;; robot initially not at any object's location (so no atLocation facts)
  )

  (:goal
    (and
      (isCool plate1)
      (inReceptacle plate1 table1)
    )
  )
)