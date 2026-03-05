(define (problem bathroom_put_two_sponges_in_tub)
  (:domain put_task)
  (:objects
    robot - agent

    tub1 - receptacle
    sink1 - sink

    sponge_counter - object
    sponge_bin - object
  )

  (:init
    ;; robot initially not at any object's location
    ;; (no atLocation facts)

    ;; no object is being held initially
    (not (holdsAny robot))

    ;; sponge locations from the scene
    (inReceptacle sponge_counter sink1)

    ;; the other sponge is in a black bin in the scene, but "bin" is not a supported
    ;; receptacle type in this domain; represent it as on the floor / not in any receptacle.
    ;; (so no inReceptacle fact for sponge_bin)

    ;; tub is open by nature; no open/close modeling needed
  )

  (:goal
    (and
      (inReceptacle sponge_counter tub1)
      (inReceptacle sponge_bin tub1)
    )
  )
)