(define (problem put_task_problem_1)
  (:domain put_task)
  (:objects
    robot - agent
    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink
    cup1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)
    (openable sink1)

    ;; object locations inferred from the scene
    ;; cup is on the counter near the microwave
    (inReceptacle cup1 microwave1)

    ;; robot starts not at any location (no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle cup1 fridge1)
      (isHot cup1)
    )
  )
)