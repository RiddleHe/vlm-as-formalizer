(define (problem put_grey_plate_spoon_on_counter)
  (:domain put_task)
  (:objects
    robot - agent

    counter - receptacle
    sink - sink

    grey_plate - receptacle
    large_metal_spoon - object
  )

  (:init
    ;; receptacle properties
    (openable sink)

    ;; object placements / containment
    (inReceptacle grey_plate sink)
    (inReceptacle large_metal_spoon grey_plate)

    ;; robot initial state (not at any location, holding nothing)
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle grey_plate counter)
      (inReceptacle large_metal_spoon grey_plate)
    )
  )
)