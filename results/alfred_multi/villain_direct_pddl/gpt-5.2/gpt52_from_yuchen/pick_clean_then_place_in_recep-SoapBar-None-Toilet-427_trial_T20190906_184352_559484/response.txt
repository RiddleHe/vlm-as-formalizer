(define (problem bathroom_put_clean_soap_on_toilet)
  (:domain put_task)
  (:objects
    robot - agent
    sink1 - sink
    bathtub1 - receptacle
    toilet1 - receptacle
    soap1 - object
  )
  (:init
    ;; receptacles and properties
    (openable sink1)

    ;; object locations / containment
    (inReceptacle soap1 bathtub1)

    ;; robot starts with no location and holds nothing
    (not (holdsAny robot))
  )
  (:goal
    (and
      (inReceptacle soap1 toilet1)
      (isClean soap1)
    )
  )
)