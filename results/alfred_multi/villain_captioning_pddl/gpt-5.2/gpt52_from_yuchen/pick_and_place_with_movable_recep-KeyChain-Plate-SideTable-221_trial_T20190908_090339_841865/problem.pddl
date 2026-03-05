(define (problem put_plate_keys_on_small_table)
  (:domain put_task)

  (:objects
    robot - agent

    dining_table - receptacle
    small_table - receptacle

    plate - object
    keys - object

    remote - object
    blue_card - object
    statue - object
    bowl - object
    tray - object
  )

  (:init
    ;; Receptacle contents / support relationships (modeled with inReceptacle = on/inside)
    (inReceptacle plate dining_table)
    (inReceptacle remote dining_table)
    (inReceptacle bowl dining_table)
    (inReceptacle tray dining_table)

    (inReceptacle keys small_table)
    (inReceptacle blue_card small_table)
    (inReceptacle statue small_table)

    ;; Robot starts not holding anything and not at any object's location
    ;; (no (holdsAny robot), no (holds robot ?o), and no (atLocation robot ?x))
  )

  (:goal
    (and
      ;; Plate ends up on the small table
      (inReceptacle plate small_table)
      ;; Keys end up on the plate
      (inReceptacle keys plate)
    )
  )
)