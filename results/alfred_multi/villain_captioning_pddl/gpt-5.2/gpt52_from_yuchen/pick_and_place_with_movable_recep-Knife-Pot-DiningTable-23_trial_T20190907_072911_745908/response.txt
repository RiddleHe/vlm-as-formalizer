(define (problem put_task_pan_knife_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    table - receptacle
    sink - sink
    fridge - fridge
    microwave - microwave

    pan - receptacle
    knife - knife
  )

  (:init
    ;; receptacle properties
    (openable fridge)
    (openable microwave)

    ;; robot initial state
    (not (holdsAny robot))

    ;; object locations (from the scene: pan and knife are on the table)
    (inReceptacle pan table)
    (inReceptacle knife table)
  )

  (:goal
    (and
      (inReceptacle pan table)
      (inReceptacle knife pan)
    )
  )
)