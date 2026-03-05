(define (problem put_candle_in_drawer_bathroom)
  (:domain put_task)

  (:objects
    robot - agent

    candle1 - object
    soapbar1 - object
    dispenser1 - object
    dispenser2 - object

    sink1 - sink
    drawer1 - receptacle
  )

  (:init
    ;; receptacle properties
    (openable drawer1)
    ;; drawer appears closed, so we do not assert (opened drawer1)

    ;; object containment / locations from the scene
    (inReceptacle soapbar1 sink1)

    (atLocation robot candle1)
    (atLocation robot dispenser1)
    (atLocation robot dispenser2)
    (atLocation robot sink1)
    (atLocation robot drawer1)

    ;; robot initially not at any object's location
    (not (atLocation robot candle1))
    (not (atLocation robot dispenser1))
    (not (atLocation robot dispenser2))
    (not (atLocation robot sink1))
    (not (atLocation robot drawer1))
  )

  (:goal
    (and
      (inReceptacle candle1 drawer1)
    )
  )
)