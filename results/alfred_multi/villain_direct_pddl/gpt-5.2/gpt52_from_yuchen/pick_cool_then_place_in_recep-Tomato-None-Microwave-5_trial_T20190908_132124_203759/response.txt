(define (problem put_task_problem)
  (:domain put_task)
  (:objects
    robot - agent
    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink
    tomato1 - object
    knife1 - knife
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)
    (openable sink1)

    ;; object locations (robot starts at no location)
    (inReceptacle tomato1 fridge1)
    (atLocation robot fridge1)
  )

  (:goal
    (and
      (isCool tomato1)
      (inReceptacle tomato1 microwave1)
    )
  )
)