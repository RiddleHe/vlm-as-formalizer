(define (problem put_task_candle_in_drawer)
  (:domain put_task)
  (:objects
    robot - agent

    sink1 - sink
    drawer1 - receptacle

    candle1 - object
    soap1 - object
    soapdispenser1 - object
    soapdispenser2 - object
  )

  (:init
    ;; receptacle properties
    (openable drawer1)

    ;; object locations / containment
    (inReceptacle soap1 sink1)
    (inReceptacle candle1 sink1)
    (inReceptacle soapdispenser1 sink1)
    (inReceptacle soapdispenser2 sink1)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle candle1 drawer1)
    )
  )
)