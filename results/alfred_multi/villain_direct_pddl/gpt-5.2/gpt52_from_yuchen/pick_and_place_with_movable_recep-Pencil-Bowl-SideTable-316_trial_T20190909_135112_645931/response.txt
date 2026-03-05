(define (problem put_task_bowl_pencil_nightstand)
  (:domain put_task)

  (:objects
    robot - agent

    bowl1 - receptacle
    pencil1 - object
    nightstand1 - receptacle
  )

  (:init
    ;; receptacle properties
    (openable bowl1)
    (openable nightstand1)

    ;; initial containment / locations
    (inReceptacle pencil1 bowl1)

    ;; robot initially not at any object's location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle pencil1 bowl1)
      (inReceptacle bowl1 nightstand1)
    )
  )
)