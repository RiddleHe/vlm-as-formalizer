(define (problem bathroom_put_tp_rolls_in_cabinet2)
  (:domain put_task)

  (:objects
    robot - agent

    cabinet1 cabinet2 - receptacle

    tp_roll1 tp_roll2 empty_roll1 - object
  )

  (:init
    ;; receptacles
    (openable cabinet1)
    (openable cabinet2)

    ;; object placements (from the scene)
    (inReceptacle tp_roll1 cabinet2)
    (inReceptacle tp_roll2 cabinet2)
    (inReceptacle empty_roll1 cabinet1)

    ;; robot initial condition
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle tp_roll1 cabinet2)
      (inReceptacle empty_roll1 cabinet2)
    )
  )
)