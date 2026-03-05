(define (problem put_clean_knife_in_cabinet_drawer)
  (:domain put_task)

  (:objects
    robot - agent

    ;; receptacles / locations
    sink1 - sink
    fridge1 - fridge
    microwave1 - microwave
    cabinetdrawer1 - receptacle

    ;; objects
    knife1 - knife
    breadbox1 - object
    cup1 - object
    spoon1 - object
    fork1 - object
    phone1 - object
    apple1 - object
    cabbage1 - object
    tomato1 - object
    tray1 - object
    plant1 - object
  )

  (:init
    ;; robot initially not at any object's location
    (not (holdsAny robot))

    ;; cabinet drawer is openable (state of opened not specified)
    (openable cabinetdrawer1)

    ;; object placements inferred from the scene
    (inReceptacle knife1 sink1)
    (inReceptacle spoon1 sink1)

    ;; items on island/countertop treated as being "in" their supporting receptacle locations
    (inReceptacle breadbox1 cabinetdrawer1) ; cabinet area (drawer/cabinet unit)
    (inReceptacle cup1 cabinetdrawer1)
    (inReceptacle phone1 cabinetdrawer1)
    (inReceptacle apple1 cabinetdrawer1)
    (inReceptacle cabbage1 cabinetdrawer1)

    ;; right countertop area (also associated with cabinet unit)
    (inReceptacle fork1 cabinetdrawer1)
    (inReceptacle tomato1 cabinetdrawer1)
    (inReceptacle tray1 cabinetdrawer1)
    (inReceptacle plant1 cabinetdrawer1)
  )

  (:goal
    (and
      (isClean knife1)
      (inReceptacle knife1 cabinetdrawer1)
    )
  )
)