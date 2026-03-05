(define (problem put_task_problem)
  (:domain put_task)
  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge

    egg1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; object locations (robot must navigate first)
    (atLocation robot fridge1)
    (atLocation robot microwave1)
    (atLocation robot egg1)

    ;; egg is initially on the counter (not in any receptacle) and not cooled
  )

  (:goal
    (and
      (isCool egg1)
      (inReceptacle egg1 microwave1)
    )
  )
)