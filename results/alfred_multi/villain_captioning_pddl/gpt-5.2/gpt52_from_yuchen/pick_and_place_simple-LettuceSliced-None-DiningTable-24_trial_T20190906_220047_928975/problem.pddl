(define (problem put_task_slice_lettuce)
  (:domain put_task)
  (:objects
    robot - agent
    lettuce - object
    knife1 - knife
    table - receptacle
  )

  (:init
    ;; Receptacle info
    (inReceptacle lettuce table)
    (inReceptacle knife1 table)

    ;; Robot initially not at any object's location and not holding anything
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isSliced lettuce)
    )
  )
)