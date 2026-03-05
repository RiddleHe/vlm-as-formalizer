(define (problem put_pot_with_sponge_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    table1 - receptacle

    pot1 pot2 - object
    sponge1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; robot initial condition: not at any object's location and holding nothing
    (not (holdsAny robot))

    ;; object locations (from scene)
    (inReceptacle pot1 microwave1)
    (inReceptacle sponge1 pot1)
    (inReceptacle pot2 microwave1)
  )

  (:goal
    (and
      (inReceptacle pot1 table1)
      (inReceptacle sponge1 pot1)
    )
  )
)