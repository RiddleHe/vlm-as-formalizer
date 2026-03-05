(define (problem put_saltshaker_in_drawer)
  (:domain put_task)
  (:objects
    robot - agent

    drawer1 - receptacle
    sink1 - sink
    fridge1 - fridge
    microwave1 - microwave

    saltshaker1 - object
  )

  (:init
    ;; receptacle properties
    (openable drawer1)

    ;; initial containment / locations from the scene
    ;; salt shaker is on the counter near the sink area (not inside any receptacle)
    (atLocation robot saltshaker1)
    (atLocation robot drawer1)

    ;; robot starts with empty hands
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle saltshaker1 drawer1)
    )
  )
)