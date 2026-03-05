(define (problem soap_in_drawer)
  (:domain put_task)

  (:objects
    robot - agent

    counter - receptacle
    drawer - receptacle
    sink - sink

    soapbar - object
  )

  (:init
    ;; receptacle properties
    (openable drawer)

    ;; object locations / containment
    (inReceptacle soapbar counter)

    ;; robot initially not at any location (no atLocation facts)
  )

  (:goal
    (and
      (isClean soapbar)
      (inReceptacle soapbar drawer)
    )
  )
)