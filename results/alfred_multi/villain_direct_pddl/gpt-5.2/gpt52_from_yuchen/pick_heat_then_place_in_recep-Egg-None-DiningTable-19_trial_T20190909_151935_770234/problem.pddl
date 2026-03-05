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
    (openable fridge)

    ;; initial object placements (from scene)
    (inReceptacle egg sink)

    ;; robot starts not at any object's location (no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle egg table)
      (isHot egg)
    )
  )
)