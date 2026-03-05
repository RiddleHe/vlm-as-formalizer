(define (problem put_pot_sponge_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    table1 - receptacle
    microwave1 - microwave

    pot1 - object
    sponge1 - object
  )

  (:init
    ;; receptacles
    (openable microwave1)

    ;; object locations (robot starts not at any location)
    (inReceptacle pot1 table1)
    (inReceptacle sponge1 pot1)
  )

  (:goal
    (and
      (inReceptacle pot1 table1)
      (inReceptacle sponge1 pot1)
    )
  )
)