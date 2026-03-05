(define (problem put_task_lettuce_chill_table)
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

    ;; object locations (on/in)
    (inReceptacle lettuce1 table)
    (inReceptacle lettuce2 table)

    ;; robot initial condition: not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isCool lettuce1)
      (inReceptacle lettuce1 table)
    )
  )
)