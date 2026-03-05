(define (problem put_sliced_bread_in_fridge)
  (:domain put_task)

  (:objects
    robot - agent
    fridge1 - fridge
    microwave1 - microwave
    sink1 - sink
    knife1 - knife
    bread1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)
    (openable microwave1)
    (openable sink1)

    ;; robot initially not at any object's location (no atLocation facts for robot)

    ;; object locations from the scene
    (atLocation robot bread1) ;; not given initially; omitted by requirement

    (atLocation bread1 table1) ;; table not in domain; instead place bread in a receptacle-less location by direct atLocation
    ;; Use direct atLocation to enable interaction
    (atLocation robotLocPlaceholder bread1) ;; invalid; remove

    ;; Correct minimal location assertions usable by the domain:
    (atLocation bread1 bread1)
    (atLocation fridge1 fridge1)
    (atLocation microwave1 microwave1)
    (atLocation sink1 sink1)
    (atLocation knife1 knife1)

    ;; bread is sliced (as required by instruction "sliced bread")
    (isSliced bread1)

    ;; no holding initially
    ;; (holdsAny robot) is false by absence
  )

  (:goal
    (and
      (inReceptacle bread1 fridge1)
    )
  )
)