(define (problem put_task_kitchen_clean_spoon_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    table - receptacle
    sink - sink

    spoon - object
  )

  (:init
    ;; receptacle properties
    (openable sink)

    ;; object locations
    (inReceptacle spoon sink)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isClean spoon)
      (inReceptacle spoon table)
    )
  )
)