(define (problem put_grey_plate_spoon_on_counter)
  (:domain put_task)

  (:objects
    robot - agent

    kitchen_sink - sink
    microwave1 - microwave

    grey_plate - object
    large_metal_spoon - object
    green_sponge - object
    long_thin_utensil - object
    yellow_handle_knife - knife
    counter - receptacle
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; robot initial condition: not holding anything and not at any location
    ;; (no (holdsAny robot) asserted)

    ;; visible object locations (in sink)
    (inReceptacle large_metal_spoon kitchen_sink)
    (inReceptacle yellow_handle_knife kitchen_sink)
    (inReceptacle green_sponge kitchen_sink)
    (inReceptacle long_thin_utensil kitchen_sink)

    ;; note: the instruction mentions a grey plate, but it is not visible in the scene;
    ;; it is left unconstrained in the initial state.
  )

  (:goal
    (and
      (inReceptacle grey_plate counter)
      (inReceptacle large_metal_spoon grey_plate)
    )
  )
)