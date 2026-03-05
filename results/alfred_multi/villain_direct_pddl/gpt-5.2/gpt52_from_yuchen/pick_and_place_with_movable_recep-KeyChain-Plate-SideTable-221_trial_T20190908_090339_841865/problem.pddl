(define (problem put_plate_keys_on_small_table)
  (:domain put_task)

  (:objects
    robot - agent

    ;; receptacles / surfaces
    dining_table - receptacle
    small_table - receptacle
    plate - receptacle

    ;; objects
    keys - object
  )

  (:init
    ;; robot initially not at any object's location (so no atLocation facts for robot)

    ;; current placements from the scene
    (inReceptacle plate dining_table)
    (inReceptacle keys small_table)
  )

  (:goal
    (and
      (inReceptacle plate small_table)
      (inReceptacle keys plate)
    )
  )
)