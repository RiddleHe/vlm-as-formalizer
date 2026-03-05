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
    spoon1 - object
    fork1 - object
    cup1 - object
    phone1 - object
    apple1 - object
    bread1 - object
    lettuce1 - object
    tomato1 - object
    tray1 - object
    plant1 - object
  )

  (:init
    ;; robot initially not at any object's location
    (not (holdsAny robot))

    ;; cabinet drawer is openable (drawer) and currently closed
    (openable cabinetdrawer1)
    (not (opened cabinetdrawer1))

    ;; object placements from the scene
    (inReceptacle spoon1 sink1)
    (inReceptacle knife1 sink1)

    ;; other items are on counters/island; model as being in an abstract drawer/counter receptacle not needed
    ;; so we only encode locations needed for the task and interactions

    ;; required condition from instruction: knife is clean
    (isClean knife1)
  )

  (:goal
    (and
      (inReceptacle knife1 cabinetdrawer1)
      (isClean knife1)
    )
  )
)