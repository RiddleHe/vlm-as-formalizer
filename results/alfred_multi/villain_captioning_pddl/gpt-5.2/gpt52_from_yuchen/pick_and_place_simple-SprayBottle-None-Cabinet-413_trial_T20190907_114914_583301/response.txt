(define (problem bathroom_put_spray_in_cabinet)
  (:domain put_task)

  (:objects
    robot - agent
    cabinet1 - receptacle
    sink1 - sink
    spraybottle1 - object
  )

  (:init
    ;; receptacle properties
    (openable cabinet1)

    ;; initial object locations (robot starts at no location per instruction)
    (atLocation robot spraybottle1)
    (atLocation robot cabinet1)
    (atLocation robot sink1)

    ;; spray bottle is not held initially
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle spraybottle1 cabinet1)
    )
  )
)