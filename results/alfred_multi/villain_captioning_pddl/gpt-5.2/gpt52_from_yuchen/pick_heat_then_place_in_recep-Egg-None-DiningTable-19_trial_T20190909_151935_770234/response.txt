(define (problem put_task_problem_egg_table)
  (:domain put_task)

  (:objects
    robot - agent

    table - receptacle
    sink - sink
    microwave - microwave
    fridge - fridge

    egg - object
  )

  (:init
    ;; receptacle properties
    (openable microwave)

    ;; initial object placements (from scene)
    (inReceptacle egg sink)

    ;; robot initially not at any object's location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle egg table)
      (isHot egg)
    )
  )
)