(define (problem put_keys_on_couch)
  (:domain put_task)

  (:objects
    robot - agent

    couch - receptacle
    side_table - receptacle

    keypair_a - object
    keypair_b - object

    box - object
    lamp - object
    chair - object
  )

  (:init
    ;; agent starts not at any object's location and holds nothing
    (not (holdsAny robot))

    ;; objects placed on/in receptacles (modeled with inReceptacle)
    (inReceptacle keypair_a side_table)
    (inReceptacle keypair_b side_table)
    (inReceptacle lamp side_table)

    ;; couch currently has a box on it
    (inReceptacle box couch)
  )

  (:goal
    (and
      (inReceptacle keypair_a couch)
      (inReceptacle keypair_b couch)
    )
  )
)