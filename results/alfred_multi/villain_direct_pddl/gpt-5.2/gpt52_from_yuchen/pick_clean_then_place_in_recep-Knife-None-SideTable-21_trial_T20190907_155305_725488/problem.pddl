(define (problem wash_knife_return_shelf)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 - sink
    shelf1 - receptacle

    knife1 - knife
  )

  (:init
    ;; receptacle properties
    (openable shelf1)

    ;; object locations in the scene
    (inReceptacle knife1 shelf1)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isClean knife1)
      (inReceptacle knife1 shelf1)
    )
  )
)