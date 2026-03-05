(define (problem put_soap_in_white_cabinet)
  (:domain put_task)

  (:objects
    robot - agent
    soapbar - object
    white_cabinet - receptacle
  )

  (:init
    ;; receptacle properties
    (openable white_cabinet)

    ;; object locations / containment
    (inReceptacle soapbar white_cabinet)

    ;; robot initially not holding anything (and not at any location)
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle soapbar white_cabinet)
    )
  )
)