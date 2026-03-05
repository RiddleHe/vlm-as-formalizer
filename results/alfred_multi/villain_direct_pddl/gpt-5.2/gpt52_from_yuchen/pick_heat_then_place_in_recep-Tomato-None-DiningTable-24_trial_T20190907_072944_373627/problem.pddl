(define (problem put_task_problem)
  (:domain put_task)
  (:objects
    robot - agent

    microwave1 - microwave
    sink1 - sink

    table1 - receptacle

    tomato1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; initial object locations (in receptacles)
    (inReceptacle tomato1 table1)

    ;; robot initially not at any object's location (no atLocation facts)
  )

  (:goal
    (and
      (isHot tomato1)
      (inReceptacle tomato1 table1)
    )
  )
)