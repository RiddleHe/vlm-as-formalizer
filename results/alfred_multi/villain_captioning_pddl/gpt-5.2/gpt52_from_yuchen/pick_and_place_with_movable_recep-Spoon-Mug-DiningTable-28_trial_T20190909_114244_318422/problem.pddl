(define (problem put_mug_spoon_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    table_round - receptacle
    table_white - receptacle
    cart_black - receptacle

    mug_blue - receptacle
    spoon1 - object
    fork1 - object
    saltshaker1 - object
    cup_metal1 - object
    tomato1 - object
    tray_black1 - object
    bottle1 - object
    bottle2 - object
    sponge_green1 - object
    bowl_blue1 - object
  )

  (:init
    ;; robot initially not at any object's location
    (not (holdsAny robot))

    ;; receptacle relations (object locations)
    (inReceptacle mug_blue cart_black)
    (inReceptacle spoon1 table_white)
    (inReceptacle fork1 table_round)
    (inReceptacle saltshaker1 table_round)
    (inReceptacle cup_metal1 cart_black)
    (inReceptacle bowl_blue1 cart_black)
    (inReceptacle sponge_green1 cart_black)
    (inReceptacle bottle1 cart_black)
    (inReceptacle bottle2 cart_black)
    (inReceptacle tomato1 table_white)
    (inReceptacle tray_black1 table_white)
  )

  (:goal
    (and
      ;; mug is on the (round) table and spoon is in the mug
      (inReceptacle mug_blue table_round)
      (inReceptacle spoon1 mug_blue)
    )
  )
)