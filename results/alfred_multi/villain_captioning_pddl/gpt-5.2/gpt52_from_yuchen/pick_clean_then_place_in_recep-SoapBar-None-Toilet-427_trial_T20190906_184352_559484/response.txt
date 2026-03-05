(define (problem bathroom_put_clean_soap_on_toilet)
  (:domain put_task)

  (:objects
    robot - agent
    bathroom_sink - sink
    soap_bar - object
    toilet - object
    pink_rag - object
  )

  (:init
    ;; Robot initially not at any object's location (so no atLocation facts for robot)

    ;; Objects initially located in the bathtub area; model bathtub as the toilet location is separate
    ;; (bathtub is not a supported receptacle type in this domain, so use atLocation for objects)
    (atLocation robot soap_bar)
    (atLocation robot pink_rag)

    ;; Fixtures as locations
    ;; (no initial atLocation for robot anywhere)
    ;; Sink exists as a receptacle (can be used to CleanObject when holding soap)
  )

  (:goal
    (and
      (isClean soap_bar)
      (inReceptacle soap_bar toilet)
    )
  )
)