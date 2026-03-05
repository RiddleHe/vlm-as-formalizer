(define (problem put_task_bathroom_soap_drawer)
  (:domain put_task)
  (:objects
    robot - agent

    drawer1 - receptacle
    sink1 - sink

    soapbar1 - object
  )

  (:init
    ;; receptacle properties
    (openable drawer1)

    ;; object placements (soap is on/at the drawer area counter)
    (inReceptacle soapbar1 drawer1)

    ;; robot starts not at any location (no atLocation facts)
  )

  (:goal
    (and
      (isClean soapbar1)
      (inReceptacle soapbar1 drawer1)
    )
  )
)