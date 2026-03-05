(define (problem put_remote_on_sofa)
  (:domain put_task)
  (:objects
    robot - agent
    remote - object
    sofa - receptacle
    coffee_table - receptacle
  )
  (:init
    ;; receptacles
    (inReceptacle remote coffee_table)

    ;; robot does not start at any location and holds nothing
    (not (holdsAny robot))
  )
  (:goal
    (and
      (inReceptacle remote sofa)
    )
  )
)