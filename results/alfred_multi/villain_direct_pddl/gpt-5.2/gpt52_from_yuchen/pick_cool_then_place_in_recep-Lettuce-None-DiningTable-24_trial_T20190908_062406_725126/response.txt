(define (problem chill_lettuce_on_table)
  (:domain put_task)
  (:objects
    robot - agent

    table - receptacle
    fridge - fridge
    microwave - microwave

    lettuce1 - object
    lettuce2 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge)

    ;; initial object placements (both lettuces are on the table)
    (inReceptacle lettuce1 table)
    (inReceptacle lettuce2 table)

    ;; robot starts holding nothing and is not initially at any object's location
    (not (holdsAny robot))
  )

  (:goal
    (and
      ;; a chilled head of lettuce is on the table
      (isCool lettuce1)
      (inReceptacle lettuce1 table)
    )
  )
)