(define (problem put_task_slice_lettuce)
  (:domain put_task)
  (:objects
    robot - agent
    lettuce - object
    table - receptacle
    knife - knife
  )
  (:init
    ;; robot initial condition: not at any object's location (no atLocation facts)

    ;; object locations
    (inReceptacle lettuce table)
    (inReceptacle knife table)
  )
  (:goal
    (and
      (isSliced lettuce)
    )
  )
)