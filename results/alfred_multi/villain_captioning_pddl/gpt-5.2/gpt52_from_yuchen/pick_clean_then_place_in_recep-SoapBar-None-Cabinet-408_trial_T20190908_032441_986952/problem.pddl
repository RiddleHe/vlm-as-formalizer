(define (problem bathroom_put_soap_in_cabinet)
  (:domain put_task)
  (:objects
    robot - agent
    white_cabinet - receptacle
    left_sink right_sink - sink
    soap_bar - object
  )

  (:init
    ;; receptacle properties
    (openable white_cabinet)
    (not (opened white_cabinet))

    ;; initial locations (robot starts at no location per instruction)
    (atLocation robot soap_bar)
    (atLocation robot white_cabinet)
    (atLocation robot left_sink)
    (atLocation robot right_sink)

    ;; robot hand state
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle soap_bar white_cabinet)
    )
  )
)