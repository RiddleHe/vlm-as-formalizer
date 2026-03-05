(define (problem put_pot_on_stove)
  (:domain put_task)

  (:objects
    robot - agent
    stove - receptacle
    sink - sink
    pot_with_water - object
  )

  (:init
    ;; receptacle properties
    ;; (stove is a receptacle that can hold the pot)

    ;; initial object locations
    (inReceptacle pot_with_water sink)

    ;; robot initially not at any object's location and holding nothing
  )

  (:goal
    (and
      (inReceptacle pot_with_water stove)
    )
  )
)